# API Documentation

## Doctors Resource

### Retrieve All Doctors

- **Endpoint**: `GET /api/doctors`
- **Description**: Retrieves information about all doctors.
- **Parameters**: None
- **Response**:
  - Status Code: `200 OK`
  - Body: JSON object containing an array of doctor objects with the following fields:
    - `id` (integer): The unique identifier of the doctor.
    - `name` (string): The name of the doctor.
    - `specialization` (string): The specialization of the doctor.
    - `cost` (decimal): The cost of the doctor's services.
    - `image_url` (string): The URL of the doctor's image.

### Retrieve a Specific Doctor

- **Endpoint**: `GET /api/doctors/:id`
- **Description**: Retrieves information about a specific doctor.
- **Parameters**:
  - `id` (integer): The unique identifier of the doctor.
- **Response**:
  - Status Code:
    - `200 OK` if the doctor is found.
    - `404 Not Found` if the doctor is not found.
  - Body:
    - JSON object containing the details of the doctor with the following fields:
      - `id` (integer): The unique identifier of the doctor.
      - `name` (string): The name of the doctor.
      - `specialization` (string): The specialization of the doctor.
      - `cost` (decimal): The cost of the doctor's services.
      - `image_url` (string): The URL of the doctor's image.

### Create a New Doctor

- **Endpoint**: `POST /api/doctors`
- **Description**: Creates a new doctor.
- **Parameters**:
  - `name` (string): The name of the doctor.
  - `specialization` (string): The specialization of the doctor.
  - `cost` (decimal): The cost of the doctor's services.
  - `image_url` (string): The URL of the doctor's image.
- **Response**:
  - Status Code:
    - `201 Created` if the doctor is successfully created.
    - `422 Unprocessable Entity` if there are validation errors.
  - Body:
    - JSON object containing the details of the newly created doctor with the following fields:
      - `id` (integer): The unique identifier of the newly created doctor.
      - `name` (string): The name of the doctor.
      - `specialization` (string): The specialization of the doctor.
      - `cost` (decimal): The cost of the doctor's services.
      - `image_url` (string): The URL of the doctor's image.

