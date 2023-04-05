# ER Diagrams vs. ER Models vs. Relational Schemas

## Metadata

* Author: *Arctype*
* Full Title: ER Diagrams vs. ER Models vs. Relational Schemas
* Category: #Type/Highlight/Article
* URL: https://medium.com/p/13fd244e85ab

## Highlights

* It’s crucial to choose the correct model for your data before starting a project. Over the years, developers coined terms to describe the various systems they use to perform this vital planning. This article will explain the differences between three different planning systems: ER models, ER diagrams, and relational schemas.
* “ER model” is short for “entity-relationship model,” a high-level data model. As the name suggests, a data model depicts how a database is structured at a logical and visual level. In layman’s terms, an ER model defines the elements and their relationship in a specific database. It’s like a “blueprint” to your database, providing a simple view of the data.
* 💡Key Insight: ER Models deal with single entities like a Student while ER Diagrams deal with sets of entities like a Table of Students
* A relational schema is also a data model representing a database structure logically. A relational schema uses tables to show a relationship between two or more entities.
* Each table in a relational schema is referred to as a relation. Rows in the table are called tuples, whereas the table columns are attributes. Tuples can be seen as the instances of an entity. A table can have many instances. For example, a school can have several students enrolled simultaneously. If student is an entity, then each student's record will be a tuple of that table (or relation).
* Primary key: A primary key is an identification attribute of each instance within a table. For the same reason, it can not have null or duplicate values. For example, student_id can be a primary key since it's unique to every student. For more information on ensuring keys are unique, check out this article.
* Foreign key: A foreign key links two tables in a relational model. It refers to a field in a table that is the primary key of another table. It can be a single attribute or a set of attributes.
* A relational schema (or model) resembles an actual database model of the information stored in the database. The terminology is a critical difference between an ER model and a relational schema. For example, an ER model deals with entities and their relationship, whereas a relational schema talks about tuples and attributes.
* An entity can be defined as any real-world object such as a student or an employee. It is usually represented as a rectangular box in an ER diagram.
* Attributes are an entity’s characteristics, such as a student’s roll number or an employee’s ID. Attributes are represented by ellipses connected to the rectangular entity box. There are several types of attributes:
* Key attribute: The main attribute with which we can identify different instances of the same entity. For example, a student ID is unique to every student and thus can be thought of as a key attribute. To represent a key attribute in an ER diagram, we usually underline the attribute name inside the ellipse.
* Composite attribute: An attribute that consists of two or more sub-attributes is called a composite attribute. For instance, a student’s name is an attribute that can be sub-divided into first name, middle name, and last name. A composite attribute is denoted by an ellipse further connected to other ellipses
* Multivalued attribute: An attribute that can take more than one value is referred to as a multivalued attribute, as in the case of a student with multiple phone numbers. A multivalued attribute is represented with two concentric ellipses
* Derived attribute: An attribute whose value can be derived from another attribute is called a derived attribute. For example, age can be found from a person’s birthdate by subtracting it from the current date. Therefore, age is a derived attribute. A dashed ellipse denotes these attributes.
* One-to-One (1:1): A “one-to-one” relationship is seen when one instance of entity 1 is related to only one instance of entity 2 and vice-versa. For example, one country can have only one capital, and each capital belongs to only one country.
* One-to-Many (1:M): When one instance of entity 1 is related to more than one instance of entity 2, the relationship is referred to as “one-to-many.” For example, an employee is supervised by only one manager at a time. However, a manager can manage many employees at the same time.
* Many-to-One (M:1): If multiple instances of entity 1 are connected to only a single instance of entity 2, we have a “many-to-one relationship.” For example, in a classroom, many students are taught by a single teacher simultaneously. Hence, the student-teacher relationship is many-to-one.
* Many-to-Many (M:N): When multiple instances of entity 1 are linked to multiple instances of entity 2, we have a “many-to-many” relationship. Imagine a scenario where an employee is assigned more than one project. If you look at the relationship from the other end, a project can have many employees as well. Thus, it is a many-to-many relationship.
