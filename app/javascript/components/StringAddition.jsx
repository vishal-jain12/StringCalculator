import React, { useState } from 'react';
import axios from 'axios';

const StringAddition = () => {
  const [input, setInput] = useState('');
  const [result, setResult] = useState('');
  const [error, setError] = useState('');

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      const response = await axios.post('/calculate', { input });
      setResult(response.data.result);
      setError('');
    } catch (err) {
      setError(err.response.data.error);
      setResult('');
    }
  }

  return (
    <>
      <div>
        <h1>String Addition</h1>
        <form onSubmit={handleSubmit}>
          <textarea
            value={input}
            onChange={(e) => setInput(e.target.value)}
            placeholder='Enter the input'
          />
          <button type='submit'>Calculate</button>
        </form>
        {result && <div>Result: {result}</div>}
        {error && <div style={{ color: 'red' }}>Error: {error}</div>}
      </div>
    </>
  )
}

export default StringAddition;
