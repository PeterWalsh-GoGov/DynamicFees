# DynamicFees

An example of some simple conditions we might have in the system right now are shown below.

1. A field called `age` greater than or equal to `18` 
2. A timestamp field called `submitted_date` that has a timestamp set more than 3 days before today

```ruby
# Set of variables submitted on the permits form
age = 23
submitted_date = 10.days.ago(Time.now)

# Some configured condition on the permit-type
bool = age >= 18 && submitted_date < 3.days.ago(Time.now)
```

## Conditions

One of the parts of Permits dynamic-fee system is "conditions". The current version of 
the conditions is hacked together. I'd like to come up with something more robust.

One of my goals here was to define a language or grammar for conditions. After some googling 
and ChatGPT I've come up with this

```
<statement> ::= <predicate> | <conjunction> | <disjunction> | <negation>

<conjunction> ::= <statement> AND <statement>
<disjunction> ::= <statement> OR <statement>
<negation> ::= NOT <statement>

<predicate> ::= <predicate_function>(<term>, <term>)

<predicate_function> ::= GreaterThanOrEqual
                       | GreaterThan
                       | LessThanOrEqual 
                       | LessThan 
                       | Equals
                       | Contains
                       | StartsWith
                       | EndsWith

<term> ::= <variable> | <constant>

<variable> ::= [a-zA-Z0-9_]+
<constant> ::= 1 | "Hello" | ["a", "b", "c"] | nil
```

JSON format

```ts
type Statement = Disjunction | Conjunction | Negation | Predicate

interface Disjunction {
    type: "disjunction"
    data: {
        left_operand: Statement,
        right_operand: Statement
    }
}

interface Conjunction {
    type: "conjunction",
    data: { 
        left_operand: Statement,
        right_operand: Statement
    }
}

interface Negation {
    type: "negation",
    data: {
        statement: Statement
    }
}

interface Predicate {
    type: "predicate"
    data: {
        operator: Operator,
        first_term: Term,
        second_term: Term
    }
}

type Operator = "gt" | "lt" | "gte" | "lte" | "eq" | "in"

type Term = Variable | Constant

interface Variable {
    type: "variable",
    data: {
        name: string
    }
}
interface Constant {
    type: "constant",
    data: {
        value: any
    }
}
```