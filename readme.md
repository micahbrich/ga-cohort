![GA](https://camo.githubusercontent.com/6ce15b81c1f06d716d753a61f5db22375fa684da/68747470733a2f2f67612d646173682e73332e616d617a6f6e6177732e636f6d2f70726f64756374696f6e2f6173736574732f6c6f676f2d39663838616536633963333837313639306533333238306663663535376633332e706e67)
# GA Cohort Planning Adjustment Tool

This is just a tiny little executable CLI that will take a GA Baseline-copied Trello board for your new cohort and adjust the dates to match when your next cohort will start.

## Installation

```bash
brew tap micahbrich/tap
brew install ga-cohort
```

That's it.

## Usage

It's a command-line app, so you run it in termal. First we'll need to configure it with your Trello API keys & tokens, which it'll walk you through the first time you run it.

```
$ cohort config
```

That'll give you some prompts and save your credentials so it'll work next time out the gate. You'll only have to do this once.

Once you're all done, it'll tell you the real command:

```
$ cohort start
```

Running that without any arguments will prompt you for the details it needs. You could alternatively run it with some parameters:

```
$ cohort start --url="https://trello.com/b/wNkMpmFX/wdi-fake-8" --start="Jun 29"
```

Either will get you going. 

It'll then show you a progress bar as it takes each card that has a due date and adjusts it's due date to one that's correct for when your cohort starts.

You might enjoy watching it adjust in realtime by opening up your Trello board's calendar. Or you can just check it out when it's done.

That's it!


- - -


#### An Important Current Caveat

- Currently, **this only works correctly if a cohort starts on a Monday**. That may prove to be a pretty obnoxious bug. We can try to come up with a way to fix it when we have to cross that bridge.

Still, it's better than doing it by hand.
