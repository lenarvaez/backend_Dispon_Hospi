const express = require('express');
const router = express.Router();

const evaluatedController = require('../controllers/evaluatedController');

router.post('/api/evaluated/save', evaluatedController.save);
router.post('/api/evaluated/update', evaluatedController.update);

module.exports = router;