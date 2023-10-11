# Ficha 4

## Exercício 1.

### 1.

Course, Grade, Person, Project, Job

professor: Job
student: Job
enrolledin: Course x Person
teaches: Person x Course
proposes: Course x Project
workson: Person x Project
grades: Course x Grade x Person


### 2.

#### a.

Nada a acrescentar

#### b.

∀x : Job, professor(x) -> ¬student(x)

#### c.

Nada a acrescentar

#### d.

(∀p : Project, ∃c: Course, proposes(c,p)) ∧
(∀x,y: Course, ∀z: Project, proposes(x,z)) ∧ proposes(y,z) -> x = y)

