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

## Appointments Resource
### Retrieve All User Appointments
- **Endpoint**: `GET /api/appointments`
- **Description**: Retrieves information about all appointments associated with the authenticated user.
- **Authentication Required**: Yes
- **Response**:
  - Status Code:
    - `200 OK` if appointments are found.
    - `404 Not Found` if no appointments are found.
  - Body: JSON object containing an array of appointment objects with the following fields:
    - `doctor` (object): Information about the doctor associated with the appointment.
      - `image_url` (string): The URL of the doctor's image.
      - `name` (string): The name of the doctor.
      - `specialization` (string): The specialization of the doctor.
      - `cost` (decimal): The cost of the doctor's services.
    - `user` (object): Information about the user associated with the appointment.
      - `name` (string): The name of the user.
      - `date_of_appointment` (string): The date of the appointment.
  - Example Response:
    ```json
    {
      "data": [
        {
          "doctor": {
            "image_url": "https://example.com/doctor1.jpg",
            "name": "Dr. John Doe",
            "specialization": "General Physician",
            "cost": 100.0
          },
          "user": {
            "name": "John Smith",
            "date_of_appointment": "Tuesday, 15 March 2022"
          }
        },
        {
          "doctor": {
            "image_url": "https://example.com/doctor2.jpg",
            "name": "Dr. Jane Smith",
            "specialization": "Dermatologist",
            "cost": 120.0
          },
          "user": {
            "name": "Alice Johnson",
            "date_of_appointment": "Friday, 18 March 2022"
          }
        }
      ],
      "message": "Appointments loaded successfully"
    }
    ```