function fn() {
  var environment = {};
  environment.Url = "https://petstore.swagger.io/";
  environment.apiVersion ="v2";

  environment.apiUrl = "https://petstore.swagger.io/v2";
  environment.userFlow = {
    id: 2,
    expectedId: "2",
    username: "siriusB",
    firstName: "Christofer",
    lastName: "Johnsson",
    email: "therion@nuclearblast.com",
    password: "password123",
    phone: "12345678",
    userStatus: 0,
    newId: 3,
    newExpectedId: "3",
    newUsername: "lemuria",
    newFirstName: "Christofer",
    newLastName: "Johnsson",
    newEmail: "therion@nuclearblast.com",
    newPassword: "password567",
    newPhone: "87654321",
    newUserStatus: 1,
    type: 'unknown',
    code: 200
  };

  environment.petFlow = {
    id: 10,
    categoryId: 10,
    categoryName: "Black",
    name: "Macedonio",
    expectedId: "10",
    status: "available"
  };

  return environment;
}