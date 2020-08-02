const controller = {};

controller.save = (req, res) => {
    const data = req.body;
    console.log(data);
    var idEvaluadoReq;
    req.getConnection((err, conn) => {
        conn.query('INSERT INTO evaluar SET ?', [data], (err, rows) => {
            console.log(rows.insertId);
            res.json({ idPregunta: rows.insertId });
        });
    })
};

module.exports = controller;