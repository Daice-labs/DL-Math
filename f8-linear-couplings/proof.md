# Trace distributions for all 512 binary-linear couplings over the field of eight elements

Let $K=\mathbb F_8$ and let $\operatorname{Tr}(x)=x+x^2+x^4$ be its trace to $\mathbb F_2$. Given an $\mathbb F_2$-bilinear form $C$ on $K\times K$, suppose the observation is the field product $w=rv$. For a fixed nonzero $w$, how many ordered factorizations $w=rv$ satisfy $C(r,v)=0$?

The trace pairing is nondegenerate. For $x\ne0$, pairing $x$ with its inverse gives $\operatorname{Tr}(1)=1$. Hence a unique binary-linear map $L:K\to K$ represents $C$ by $C(r,v)=\operatorname{Tr}(L(r)v)$. Each such map has the unique form

$$
L(r)=ar+br^2+cr^4,\qquad a,b,c\in K.
$$

Indeed these polynomials are binary-linear, and a nonzero polynomial of degree at most four cannot vanish on eight field elements. There are $8^3=512$ coefficient triples and $2^{3\cdot3}=512$ binary-linear maps. For $r\ne0$, the coupling condition therefore reduces to $\operatorname{Tr}(wq(r))=0$, where $q(r)=a+br+cr^3$.

## The distribution theorem

As $r$ ranges over $K^\times$, the multiset of values of $q(r)$ has exactly three possible forms. Write $P=\ker\operatorname{Tr}$.

| Condition | Number of maps | Values and multiplicities |
| --- | ---: | --- |
| $b=c=0$ | 8 | The value $a$ occurs seven times. |
| Exactly one of $b,c$ is nonzero | 112 | Each element of $K$ except $a$ occurs once. |
| $bc\ne0$ | 392 | Put $h=(b/c)^4$ and $k=bh$. The center $a+k$ occurs three times. The other three points of $a+k+kP$ each occur once. The point $a$ lies outside that plane and occurs once. |

**Proof.** The constant case follows directly. In the second case both $r\mapsto r$ and $r\mapsto r^3$ permute the seven nonzero elements, since $\gcd(3,7)=1$.

For $bc\ne0$, we have $h^2=b/c$ and $ch^3=bh=k$. Substituting $r=ht$ gives $q(ht)=a+kD(t)$ with $D(t)=t^3+t$. The nonzero $t$ fall into three classes.

* If $t\in P\setminus\{0\}$, dividing $t^4+t^2+t=0$ by $t$ gives $D(t)=1$. This accounts for three inputs.
* If $t=1$, then $D(t)=0$.
* If $\operatorname{Tr}(t)=1$ and $t\ne1$, the factorization $t^4+t^2+t+1=(t+1)(t^3+t^2+1)$ gives $D(t)=1+p$, where $p=t^2+t$ lies in $P\setminus\{0\}$. Conversely, each nonzero $p\in P$ gives $t=1+p^2$. This $t$ has trace one and $t^2+t=p$, since $p^4+p^2=p$. Thus these three values occur once apiece.

Multiplying by $k$ and translating by $a$ gives the last row. The point $a$ is outside the translated plane because $1\notin P$. The three map counts follow by choosing $a,b,c$ in each row. ∎

## Counting compatible factorizations

Define $\chi(x)=(-1)^{\operatorname{Tr}(x)}$. For $w\ne0$, each choice of $r\ne0$ determines $v=w/r$. Its compatibility indicator is $(1+\chi(wq(r)))/2$. In the constant case the count is seven if $\operatorname{Tr}(aw)=0$ and zero otherwise. In the punctured-permutation case the count is $4-\mathbf 1_{\operatorname{Tr}(aw)=0}$, since a nonzero trace functional has four zeros.

In the last case put $z=kw$ and $d=a+k$. The count is

$$
N(w)=\frac{7+\chi(dw)\bigl(2+4\mathbf 1_{z=1}+\chi(z)\bigr)}{2}.
$$

Indeed the multiset consists of one copy of the translated plane $d+kP$, two extra copies of its center, and one copy of $a=d+k$. The character sum over $P$ is four on its annihilator $\{0,1\}$ and zero elsewhere. Here $z\ne0$, so only $z=1$ contributes the plane term. This proves the formula and gives $N(w)>0$ for every nonzero $w$ in this case. These counts concern the ordered factors of a nonzero product in $K$.
