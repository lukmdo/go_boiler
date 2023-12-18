package main

import (
	crand "crypto/rand"
	"math/big"
	mrand "math/rand"
	"testing"

	"github.com/stretchr/testify/require"
)

func TestRandInt(t *testing.T) {
	must := require.New(t)
	must.NotEqual(mrand.Int(), mrand.Int())
}

func BenchmarkRandInt(b *testing.B) {
	b.Run("math/rand", func(b *testing.B) {
		//b.ReportAllocs()
		for i := 0; i < b.N; i++ {
			_ = mrand.Int()
		}
	})

	b.Run("crypto/rand", func(b *testing.B) {
		//b.ReportAllocs()
		for i := 0; i < b.N; i++ {
			_, _ = crand.Int(crand.Reader, big.NewInt(100_000_000))
		}
	})
}
