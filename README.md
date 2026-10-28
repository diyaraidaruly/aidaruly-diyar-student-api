# Aidaruly Diyar Student API

Author: Aidaruly Diyar, group IT2-2307

Documentation: REST API for managing university students, built with Spring Boot.
Implemented: Create, Read and Update operations.

## Change description
Added `PUT /api/students/{id}` endpoint that updates the full name and
group of an existing student. Returns 404 if the student does not exist.
