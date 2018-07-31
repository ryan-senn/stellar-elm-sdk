# Stellar Elm SDK / API Examples

This repository started as a proof of concept that the [Elm Language](http://elm-lang.org) could be an excellent candidate as a Stellar SDK with it's strong static types.

This Repository currently hosts 2 things:
- A Stellar SDK written in Elm
- An Example SPA (single page application) written in Elm, that uses the SDK to interact with the Stellar Network.

The SDK code lives in `/lib/Stellar`, while the SPA lives in `/src`.

I've also set up Github Pages in `/docs`, which can be seen here: https://ryan-senn.github.io/stellar-elm

## Initial Goals

The initial goal is to provide a solid SDK and implement a [Stellar laboratory clone](https://www.stellar.org/laboratory/#explorer?resource=accounts&endpoint=single&network=test) in Elm (the official one is written is React/Redux).
Since Redux is strongly influenced by Elm (or the Elm Architecture rather), I wanted to see how things would go.

## Future Plans

Now that the SDK and SPA are somewhat stable, I intend to split the SDK into it's oen repository and make it available on the official Elm Package manager.
If you are unfamiliar with Elm, documentation and semantic versioning are enforced by the package manager, so I intend to have well documented examples there.

I also intend to beef up the SPA and make it more user friendly (better validation etc).

Eventually, I would like to also add the API Reference like here: https://www.stellar.org/developers/horizon/reference/endpoints/accounts-single.html

## Build

If you want to run the code locally, you'll need to run the following (skip steps if you already have for example Elm)

- If you don't have Elm tooling, install it:
    - `npm i -g elm elm-live`

- Clone the Repo
    - `git clone git@github.com:ryan-senn/stellar-elm.git`
    - `cd stellar/elm`

- Compile the Elm code: (it will prompt to install the dependencies, just hit enter)
    - On Osx: `./elm-live-osx.sh`
    - On Linux: `./elm-live-linux.sh`

If you want to add the Time Traveller, open the shell script and add `--debug` at the end.

## Examples / Live Demo

In case you missed the link further up, the live example runs on Github Pages (set up in `/docs`): https://ryan-senn.github.io/stellar-elm