const express = require('express');
const router = express.Router();

const evaluationController = require('../controllers/evaluationController');

router.post('/api/evaluation/save', evaluationController.save);

module.exports = router;