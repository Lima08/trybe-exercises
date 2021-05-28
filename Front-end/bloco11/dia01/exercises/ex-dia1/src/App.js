const Task = (value) => {
  return (
    <li>{value}</li>
  );
};

const list = ['Estudar', 'Correr', 'Amar'];

function App() {
  return (
    <ol >
      {list.map(element => Task(element))}
    </ol>
  );
}

export default App;
