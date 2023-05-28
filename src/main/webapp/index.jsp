<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Student List</title>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }

        th, td {
            text-align: left;
            padding: 8px;
        }

        th {
            background-color: #008CBA;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        form {
            margin: 20px;
            display: inline-block;
        }

        label {
            display: inline-block;
            width: 100px;
            text-align: right;
            margin-right: 5px;
        }

        input[type="text"], input[type="number"] {
            display: inline-block;
            width: 150px;
            margin-bottom: 5px;
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input[type="button"] {
            padding: 5px 10px;
            background-color: #008CBA;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        input[type="button"]:hover {
            background-color: #006CBA;
        }

        .error {
            color: red;
            font-weight: bold;
            margin-bottom: 10px;
        }

    </style>
</head>
<body>
<h1>Student List</h1>

<form>
    <label for="firstName">First name:</label>
    <input type="text" id="firstName" name="firstName"><br>

    <label for="lastName">Last name:</label>
    <input type="text" id="lastName" name="lastName"><br>

    <label for="group">Group:</label>
    <input type="text" id="group" name="group"><br>

    <label for="age">Age:</label>
    <input type="number" id="age" name="age"><br>

    <label for="subject">Subject:</label>
    <input type="text" id="subject" name="subject"><br>

    <input type="button" value="Add Student" onclick="addStudent()">
</form>

<table>
    <thead>
    <tr>
        <th>First Name</th>
        <th>Last Name</th>
        <th>Group</th>
        <th>Age</th>
        <th>Subject</th>
    </tr>
    </thead>
    <tbody id="studentTableBody">
    </tbody>
</table>

<script>
    function addStudent() {
        let firstName = document.getElementById("firstName").value;
        let lastName = document.getElementById("lastName").value;
        let group = document.getElementById("group").value;
        let age = document.getElementById("age").value;
        let subject = document.getElementById("subject").value;

        let xhr = new XMLHttpRequest();
        xhr.open("POST", "StudentController");
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    let success = JSON.parse(xhr.responseText);
                    if (success) {
                        getStudentList();
                    } else {
                        alert("Error");
                    }
                } else {
                    alert("Error");
                }
            }
        }
        xhr.send("firstName=" + firstName + "&lastName=" + lastName + "&group=" + group +
            "&age=" + age + "&subject=" + subject);
    }

    function getStudentList() {
        let xhr = new XMLHttpRequest();
        xhr.open("GET", "StudentController");
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    let students = JSON.parse(xhr.responseText);
                    let studentTableBody = document.getElementById("studentTableBody");
                    studentTableBody.innerHTML = "";
                    for (let i = 0; i < students.length; i++) {
                        let student = students[i];
                        let row = document.createElement("tr");
                        let cell1 = document.createElement("td");
                        let cell2 = document.createElement("td");
                        let cell3 = document.createElement("td");
                        let cell4 = document.createElement("td");
                        let cell5 = document.createElement("td");
                        cell1.innerHTML = student.firstName;
                        cell2.innerHTML = student.lastName;
                        cell3.innerHTML = student.group;
                        cell4.innerHTML = student.age;
                        cell5.innerHTML = student.subject;
                        row.appendChild(cell1);
                        row.appendChild(cell2);
                        row.appendChild(cell3);
                        row.appendChild(cell4);
                        row.appendChild(cell5);
                        studentTableBody.appendChild(row);
                    }
                } else {
                    alert("Error");
                }
            }
        }
        xhr.send();
    }

    getStudentList();
</script>
</body>
</html>
