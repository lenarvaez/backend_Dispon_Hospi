const controller = {};

controller.list = (req, res) => {
    req.getConnection((err, conn) => {
        conn.query('SELECT * FROM evaluado', (err, users) => {
            if (err) {
                res.json(err);
            }
            res.json({users});
        });
    });
};

controller.save = (req, res) => {
    const data = req.body;
    console.log(data);
    var idEvaluadoReq;
    req.getConnection((err, conn) => {
        conn.query('INSERT INTO evaluado SET ?', [data], (err, rows) => {
            idEvaluadoReq = rows.insertId;
            console.log(rows.insertId);
            res.json({ idEvaluado: rows.insertId });
        });
    })
};

module.exports = controller;