/**
 * Import function triggers from their respective submodules:
 *
 * const {onCall} = require("firebase-functions/v2/https");
 * const {onDocumentWritten} = require("firebase-functions/v2/firestore");
 *
 * See a full list of supported triggers at https://firebase.google.com/docs/functions
 */

const { onRequest } = require("firebase-functions/v2/https");
const logger = require("firebase-functions/logger");

// Create and deploy your first functions
// https://firebase.google.com/docs/functions/get-started

exports.generateRandomNumber = onRequest((request, response) => {
  const randomNumber = Math.floor(Math.random() * 1000);
  logger.info(
    `generateRandomNumber function has been invoked, sending back ${randomNumber}.`,
    { structuredData: true }
  );
  response.status(200).json(randomNumber);
});
