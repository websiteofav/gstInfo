import express from "express";
import bodyParser from "body-parser";
import gstRoutes from "./routes/gst.js";

const app = express();

const PORT = process.env.PORT || 3000;

app.use(bodyParser.json());

app.use("/gst", gstRoutes);

app.get("/", (req, res) => {
  res.send("Hello Homepage");
});

app.listen(PORT, () => console.log(`Server running on Port ${PORT}`));
