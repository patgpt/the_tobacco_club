# The Tobacco Club Firebase Schema Design Document

## 1: Define Data Entities

Define the data entities that will be used for data storage and manipulation. Data entities represent the various object types or concepts that our site will interact with. Here is a list of data entities for our site:
- Users
- Smoking Journals
- Milestones/Achievements
- Support Groups
- Resources/Articles

## 2: Data Modelling

```javascript
// Schema design using Firebase Firestore
// Users Collection:
// Document per user, using their unique user IDs.
// Fields: uid (User ID), email, name, DOB, joined_date, contact number, support_group_id, etc.

// Smoking Journals Collection:
// Document per journal entry, with a unique ID.
// Fields: user_id, entry_date, number_of_cigarettes, notes, etc.

// Milestones/Achievements Collection:
// Document per milestone or achievement.
// Fields: title, description, reward, required_actions, etc.

// Support Groups Collection:
// Document per support group.
// Fields: name, description, members (an array of user IDs), created_by, etc.

// Resources/Articles Collection:
// Document per resource or article.
// Fields: title, content, author, category, created_date, likes, comments, etc.
```

## 3: Establishing Relationships


