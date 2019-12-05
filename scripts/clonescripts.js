#!/usr/bin/env node

const fs = require("fs");
const path = require("path");
const shell = require("shelljs");
const Git = require("nodegit");
const hostedGitInfo = require("hosted-git-info");

shell.echo("Cloning scripts...");

const binDirname = "bin";
const scriptsDirname = "shell-scripts";

const gitRepos = [
  {
    url: "https://github.com/ashryanbeats/gcu.git",
    name: "gcu"
  },
  { url: "https://github.com/ashryanbeats/ghurl.git", name: "ghurl" }
];

const cdToUser = shell.cd("~");

if (cdToUser.code !== 0) {
  shell.echo("Unable to find local user folder.");
  shell.exit(1);
}

const userDirContents = shell.ls(shell.pwd());

if (!userDirContents.includes(binDirname)) {
  fs.mkdirSync(binDirname);
}
if (!userDirContents.includes(scriptsDirname)) {
  fs.mkdirSync(scriptsDirname);
}

const cdToScripts = shell.cd(scriptsDirname);

if (cdToScripts.code !== 0) {
  shell.echo("Unable to find scripts folder.");
  shell.exit(1);
}

Promise.all(gitRepos.map(repo => cloneRepo(repo)))
  .then(clonedRepos => makeSymlinks(clonedRepos))
  .then(clonedRepos => changeRemotes(clonedRepos))
  .then(clonedRepos => makeExecutables(clonedRepos))
  .then(clonedRepos => finalize(clonedRepos))
  .catch(err => shell.echo(err));

function cloneRepo(repo) {
  console.log(`Cloning repo ${repo.name}`);

  return Git.Clone(repo.url, repo.name)
    .then(repo => repo)
    .catch(err => console.log(err));
}

function makeSymlinks(clonedRepos) {
  console.log(`Making symlinks...`);

  return clonedRepos.map(repo => {
    const repoPaths = getRepoPaths(repo);
    shell.ln("-s", repoPaths.scriptPath, repoPaths.symlinkPath);

    return repo;
  });
}

function changeRemotes(clonedRepos) {
  console.log(`Changing remotes to ssh...`);

  return Promise.all(
    clonedRepos.map(repo => {
      return repo
        .getRemote("origin")
        .then(remote => {
          const gitInfo = hostedGitInfo.fromUrl(remote.url());
          const newUrl = gitInfo.ssh();
          const result = Git.Remote.setUrl(repo, "origin", newUrl);

          return repo;
        })
        .catch(err => console.log("err", err));
    })
  );
}

function makeExecutables(clonedRepos) {
  console.log(`Setting execution permissions on scripts...`);

  return clonedRepos.map(repo => {
    const repoPaths = getRepoPaths(repo);
    shell.chmod("+x", repoPaths.scriptPath);
    return repo;
  });
}

function finalize(clonedRepos) {
  console.log(`Repos cloned!`);
  shell.exit(0);
}

function getRepoPaths(repo) {
  const pathSegs = repo.path().split(path.sep);
  const dirIdx = pathSegs.indexOf(scriptsDirname);
  const repoDirname = pathSegs[dirIdx + 1];

  const scriptPath = `~/${scriptsDirname}/${repoDirname}/${repoDirname}.sh`;
  const symlinkPath = `~/${binDirname}/${repoDirname}`;

  return { scriptPath, symlinkPath };
}
