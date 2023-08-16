# ruby-read-calendar-events

This sample will show you to easily read your calendar events using the Nylas Ruby SDK.

## Setup

### System dependencies

- Ruby v3.x

### Gather environment variables

You'll need the following values:

```text
V3_TOKEN =
GRANT_ID =
```

Add the above values to a new `.env` file:

```bash
$ touch .env # Then add your env variables
```

### Install dependencies

```bash
$ gem install nylas
$ gem install dotenv
```

## Usage

Run the script using the `ruby` command:

```bash
$ ruby ReadEvents.rb
```

You will get a list of all events in the following format

```text
Id: dshdjhsdjhd | Title: This is a meeting | Start: 2023-01-01 10:00 | End: 2023-01-01 10:30:00 | Participants [{Name: Swag, Emai: swag@nylas.com, Status: yes}]
```

## Learn more

Visit our [Nylas Ruby SDK documentation](https://developer.nylas.com/docs/developer-tools/sdk/ruby-sdk/) to learn more.
