importScripts("https://www.gstatic.com/firebasejs/8.10.0/firebase-app.js");
importScripts("https://www.gstatic.com/firebasejs/8.10.0/firebase-messaging.js");


firebase.initializeApp({
  apiKey: "AIzaSyBg4zv0Vlr6253_joYHsrQEsjsJFnN9lIg",
  authDomain: "my-project-66697.firebaseapp.com",
  databaseURL: "https://my-project-66697-default-rtdb.firebaseio.com",
  projectId: "my-project-66697",
  storageBucket: "my-project-66697.appspot.com",
  messagingSenderId: "802183520437",
  appId: "1:802183520437:web:70e2a15ca13b00ced7defc",
  measurementId: "G-BFE5KMWCGM"
});
const messaging = firebase.messaging();

// Optional:
messaging.onBackgroundMessage((message) => {
console.log("onBackgroundMessage", message);
});