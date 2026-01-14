import numpy as np

def primes(limit):
    if limit < 2:
        return np.array([], dtype=int)
    
    is_prime = np.ones(limit + 1, dtype=bool)
    is_prime[0] = is_prime[1] = False
    
    for i in range(2, int(np.sqrt(limit)) + 1):
        if is_prime[i]:
            is_prime[i*i::i] = False
    
    primes = np.where(is_prime)[0]
    return primes

if __name__ == "__main__":
    primes = primes(1_000_000)
    print(f"First 10 primes: {primes[:10]}")