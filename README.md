# Lab 1: Kigali Self-Driving Car Simulation

- **Name:** Teninlanimi Taiwo
- **GitHub:** teni-taiwo-alu
- **Course:** Introduction to Python Programming and Databases, BSE Year 1 Trimester 2

## About the project

This lab simulates a self-driving car going from ALU Rwanda to the Kigali Convention Centre.
The road is a Python list and each item in the list is 100 m of road.
The car reads each sign and decides what to do, and a web page shows the car driving.

## Files

| File | What it does |
|---|---|
| `road_simulation.py` | The road list and the 10 functions I completed |
| `analyze_log.sh` | Bash script that gives a summary of the log file |
| `transit_program.py` | Given by the lab. Runs the road editor and the trip |
| `engine.py` | Given by the lab. Runs the web server |
| `index.html` | Given by the lab. The page that shows the car |

`transit_session.log` is not in the repo because the program creates it when you run it.

## How to run

You only need Python 3.

```
git clone https://github.com/teni-taiwo-alu/lab1_teni-taiwo-alu.git
cd lab1_teni-taiwo-alu
python3 road_simulation.py
```

1. Enter your driver name.
2. In the road editor, choose `5` to start driving.
3. Open the link shown in the terminal.
4. Go back to the terminal and press Enter. The car starts moving.

## Road signs

| Sign | What the car does |
|---|---|
| A number from 20 to 100 | This becomes the new speed limit |
| `zebra` | The car stops and waits, then continues |
| `bus` | The car moves to the left lane |
| `road` | Nothing happens |

The zebra waiting time is set by `ZEBRA_WAIT` in `road_simulation.py`. It is 15 seconds in the code we were given.

## Functions I completed

| Function | What it does |
|---|---|
| `is_valid_sign` | Checks if a sign is allowed |
| `get_sign_type` | Returns `bus`, `zebra`, `speed` or `road` |
| `get_speed_limit` | Returns the new limit, or keeps the current one |
| `get_target_speed` | Returns 0 at a zebra, otherwise the limit |
| `adjust_speed` | Adds 5 when below the target and subtracts 20 when above |
| `count_signs` | Counts the speed signs, zebras and buses |
| `ask_for_number` | Keeps asking until the input is a whole number in range |
| `insert_sign` | Adds a sign at a position if the position is valid |
| `replace_sign` | Changes the sign at an index if the index is valid |
| `get_journey_summary` | Returns the signs passed, road length, start and end names |

## Input checks

- Only `bus`, `zebra` or a number from 20 to 100 can be added to the road.
- If you type text or a number out of range in the menu, the program asks again.
- A wrong position or index returns `False` and the road does not change.

## Log analyser

Run the simulation at least once first, then run:

```
bash analyze_log.sh
```

You can also give it another log file:

```
bash analyze_log.sh my_log.log
```

It shows the number of sessions, zebra stops and lane changes, and the driver and top speed of the latest trip.
If the file does not exist, it prints an error and stops with exit code 1.
