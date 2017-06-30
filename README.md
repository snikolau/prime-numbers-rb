# Primer task

Simple CLI application to print table with result of multiplications prime numbers.

## Usage
Run in command line:

###Preconditions
```
bundle install
```

###Example usage
```
bin/primer_task --count 5

```
Should output: 

```bash
+----+----+----+----+----+-----+
|    | 2  | 3  | 5  | 7  | 11  |
+----+----+----+----+----+-----+
| 2  | 4  | 6  | 10 | 14 | 22  |
| 3  | 6  | 9  | 15 | 21 | 33  |
| 5  | 10 | 15 | 25 | 35 | 55  |
| 7  | 14 | 21 | 35 | 49 | 77  |
| 11 | 22 | 33 | 55 | 77 | 121 |
+----+----+----+----+----+-----+
```

###Testing

To run tests:

```
bundle exec rspec
```
