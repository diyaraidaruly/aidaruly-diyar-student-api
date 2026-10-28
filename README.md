# Aidaruly Diyar Student API

Author: Aidaruly Diyar, group IT2-2307

Overview: Student management service using Spring Boot and PostgreSQL database.
Implemented: Create, Read and Update operations.

## Change description
Added `PUT /api/students/{id}` endpoint that updates the full name and
group of an existing student. Returns 404 if the student does not exist.
