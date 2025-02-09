import { Link } from "react-router-dom";

const Dashboard = () => {
  return (
    <div>
      <h2>Painel de Controle</h2>
      <nav>
        <ul>
          <li><Link to="/reservas">Gerenciar Reservas</Link></li>
          <li><Link to="/faturamento">Consultar Faturamento</Link></li>
          <li><Link to="/logout">Sair</Link></li>
        </ul>
      </nav>
    </div>
  );
};

export default Dashboard;
