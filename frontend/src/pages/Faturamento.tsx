import { useState } from "react";
import api from "../services/api";

const Faturamento = () => {
  const [ano, setAno] = useState("");
  const [mes, setMes] = useState("");
  const [total, setTotal] = useState<number | null>(null);

  const buscarFaturamento = async () => {
    const response = await api.get("/reservas/faturamento", { params: { ano, mes } });
    setTotal(response.data.total);
  };

  return (
    <div>
      <h2>Faturamento Mensal</h2>
      <input type="number" placeholder="Ano" value={ano} onChange={(e) => setAno(e.target.value)} />
      <input type="number" placeholder="Mês" value={mes} onChange={(e) => setMes(e.target.value)} />
      <button onClick={buscarFaturamento}>Consultar</button>
      {total !== null && <p>Faturamento: R$ {total.toFixed(2)}</p>}
    </div>
  );
};

export default Faturamento;
