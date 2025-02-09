import { useState, useEffect } from "react";
import api from "../services/api";

interface Reserva {
  id: number;
  cliente: string;
  dataCheckin: string;
  dataCheckout: string;
  valorTotal: number;
}

const Reservas = () => {
  const [reservas, setReservas] = useState<Reserva[]>([]);
  const [dataInicio, setDataInicio] = useState("");
  const [dataFim, setDataFim] = useState("");

  useEffect(() => {
    carregarReservas();
  }, []);

  const carregarReservas = async () => {
    const response = await api.get("/reservas", { params: { dataInicio, dataFim } });
    setReservas(response.data);
  };

  return (
    <div>
      <h2>Reservas</h2>
      <input type="date" value={dataInicio} onChange={(e) => setDataInicio(e.target.value)} />
      <input type="date" value={dataFim} onChange={(e) => setDataFim(e.target.value)} />
      <button onClick={carregarReservas}>Filtrar</button>
      <ul>
        {reservas.map((reserva) => (
          <li key={reserva.id}>
            {reserva.cliente} - {reserva.dataCheckin} a {reserva.dataCheckout} - R$ {reserva.valorTotal.toFixed(2)}
          </li>
        ))}
      </ul>
    </div>
  );
};

export default Reservas;
