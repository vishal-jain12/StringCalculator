import React, { useState } from 'react';
import axios from 'axios';

const StringAddition = () => {
  const [input, setInput] = useState('');
  const [result, setResult] = useState('');
  const [error, setError] = useState('');

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      const response = await axios.post('/calculate_addition', { input });
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
      </div>
    </>
  )
}