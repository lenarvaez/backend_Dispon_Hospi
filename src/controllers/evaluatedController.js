const controller = {};

controller.save = (req, res) => {
    const data = req.body;
    console.log(data);
    var idEvaluadoReq;
    req.getConnection((err, conn) => {
        conn.query('INSERT INTO evaluado SET ?', [data], (err, rows) => {
            console.log(rows.insertId);
            res.json({ idEvaluado: rows.insertId });
        });
    })
};

controller.update = (req, res) => {
    const data = req.body;
    console.log(data);
    idEvaluadoReq = data['idEvaluado'];
    phone = data['telefono'];
    req.getConnection((err, conn) => {
        conn.query('UPDATE evaluado SET telefono=? WHERE idEvaluado=?', [phone, idEvaluadoReq], (err, rows) => {
            console.log(rows.insertId);
            res.json({ idEvaluado: rows.insertId });
        });
    })
};

module.exports = controller;