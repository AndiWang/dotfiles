# Money & Business Red Flags — Forensic Playbook

Detailed accounting, capital-allocation, and corporate-governance tells. Pull this when the input is a financial pitch, company narrative, earnings report, IPO prospectus, sell-side note, or M&A deal and you need forensic depth.

The premise: management can lie with words, but the cash flow statement and the proxy statement are much harder to lie with. The further you get from "audited cash" and the closer to "narrative," the more the bullshit lives.

## Table of Contents

1. The Income Statement Tells (revenue and earnings tricks)
2. The Cash Flow Tells (where the truth usually lives)
3. The Balance Sheet Tells (what's hiding off and on)
4. The Proxy Statement Tells (incentives and people)
5. Capital Allocation Tells
6. Roll-up and M&A Tells
7. IPO and SPAC Tells
8. Sell-side Research Tells
9. Macro / Market Commentary Tells
10. The Buffett Filters (what good actually looks like)

---

## 1. The Income Statement — Revenue and Earnings Tricks

### Adjusted EBITDA (Munger: "bullshit earnings")

EBITDA = Earnings Before Interest, Taxes, Depreciation, and Amortization. *Adjusted* EBITDA further excludes whatever management wants to exclude.

- Munger: "I think that every time you see the word EBITDA, you should substitute the words 'bullshit earnings.'"
- Buffett: "Does management think the tooth fairy pays for capex?" Depreciation represents real wear and tear on real assets. Excluding it is excluding reality.
- Red flag: heavy emphasis on Adjusted EBITDA over GAAP net income, especially when GAAP net income is negative or worsening.
- Worse red flag: the "adjustments" change definition between quarters. Compare today's adjusted EBITDA bridge to last year's. If new adjustments have been added, ask why.

### Stock-Based Compensation Excluded from "Earnings"

Many tech companies present "non-GAAP earnings" that exclude SBC. SBC is a real cost. It is paid in shares the company has to either issue (diluting you) or buy back (using your cash to neutralize the dilution). Either way, you pay.

- Buffett: "If options aren't a form of compensation, what are they? If compensation isn't an expense, what is it? And if expenses shouldn't go into the calculation of earnings, where in the world should they go?"
- Calculate: real earnings ≈ GAAP earnings (which already includes SBC expense). The "non-GAAP" headline number is marketing.
- Watch SBC as a % of revenue. Anything sustained above 10-15% is hostile to outside shareholders.

### "One-Time" Charges That Recur Every Year

"Restructuring charges," "impairments," "transformation costs," "one-time legal," "non-recurring." Look at the last 5 years. If "one-time" appears every year, it isn't one-time — it's a normal cost the company is hiding under that label.

- This often masks chronic problems: a business model that requires constant restructuring is itself the problem.

### Revenue Recognition Aggression

- **Channel stuffing**: shipping product to distributors at quarter-end to book revenue, knowing it will come back as returns.
- **Bill-and-hold**: invoicing for product not yet shipped (legal under specific conditions; abused outside them).
- **Long-term contract acceleration**: pulling future revenue forward via percentage-of-completion or upfront recognition of subscriptions.
- **Related-party revenue**: selling to entities you control or have invested in (Enron specialty).
- Tell: revenue growing while *cash collected from customers* (operating cash flow) lags badly.

### Margin Expansion Without Cause

If gross or operating margins expand suddenly with no clear operational reason (new product, scale, pricing), look for:
- Capitalizing what was previously expensed (R&D, software costs, customer acquisition)
- Changing useful life assumptions on depreciable assets to lower D&A
- Pension assumption changes to reduce reported pension expense
- Removing SBC from "operating" lines

### Customer Concentration

If one customer is >10% of revenue, that customer holds the company hostage on price. If one customer is >20-30%, the company isn't really independent.

---

## 2. The Cash Flow Statement — Where the Truth Usually Lives

Buffett: "Earnings can be cooked, cash cannot." Almost true. Cash flow can also be massaged, but it's harder.

### Cash Flow Lagging Earnings

Compare net income to operating cash flow over 3-5 years. If reported earnings consistently exceed cash generated from operations, the "earnings" are an accounting construct. Either receivables are growing faster than revenue (customers aren't paying), inventory is bloating (product isn't selling), or the accruals are aggressive.

### Operating Cash Flow vs Free Cash Flow

Free cash flow = operating cash flow − capex. Many companies tout operating cash flow alone because they're capital-intensive and FCF is much smaller (or negative).

- "Adjusted free cash flow" is an immediate red flag — the same trick as Adjusted EBITDA, applied to cash.
- Capex hidden in the financing section (e.g., capitalized leases under old accounting, or capitalized R&D moved out of operating) is a tell.

### Working Capital Tells

- Receivables growing faster than revenue → customers aren't paying, or "channel stuffing"
- Inventory growing faster than sales → product isn't moving, write-down coming
- Payables stretching → company is paying suppliers slower, often because it can't pay them faster
- "Days sales outstanding" creeping up over multiple quarters → revenue quality deteriorating

### Capitalization vs Expense

Watch whether things that should be expensed are being capitalized:
- R&D (some industries allow this; abuse is common)
- Customer acquisition costs
- Software development
- Maintenance costs treated as capex
- Cloud infrastructure costs treated as capex

Each capitalization moves a real cash cost off the income statement and onto the balance sheet, where it sits as an "asset" until quietly written down later. Net income looks better in the meantime.

---

## 3. The Balance Sheet — On and Off

### Goodwill and Intangibles Ballooning

Goodwill = the premium paid in acquisitions over book value. A balance sheet dominated by goodwill is a balance sheet built by overpaying for acquisitions. Look for:
- Goodwill > 50% of total assets
- Frequent goodwill write-downs (proves the acquisitions destroyed value)
- "Indefinite life" intangibles never amortized (a flag in many cases)

### Debt Hidden in Plain Sight

- **Operating leases** (now on balance sheet under ASC 842 / IFRS 16, but many investors still under-count them as debt)
- **Off-balance-sheet structured entities** (Enron specialty; rarer post-2002 but not gone)
- **Receivables financing / factoring** (selling receivables to look like cash; a debt by another name)
- **Supply chain finance / reverse factoring** (paying suppliers via a financial institution; a hidden form of borrowing)
- **Pension underfunding** (the deficit is debt to retirees)
- **Operating lease commitments + minimum purchase obligations** in 10-K footnotes

### Debt Maturity Profile

A company can be solvent on paper and still die because too much debt comes due in one year and capital markets are closed. Always check the debt maturity schedule (in 10-K). If >25% comes due in any single year, the company has a refinancing risk that depends on market conditions outside its control.

### "Net Debt" Excluding Hostile Things

Some companies present "net debt" excluding pension obligations, operating leases, or contingent liabilities. The full picture includes everything they would have to pay if the lights went out.

---

## 4. The Proxy Statement — Where the People Stuff Lives

The proxy statement is the most under-read document in finance. It tells you about compensation, board composition, related-party transactions, and insider ownership. Skim every proxy of every company you take seriously.

### CEO Pay Structure Tells

- **Pay tied to non-GAAP metrics the CEO defines** — circular and predictable
- **"TSR" (total shareholder return) vesting with cherry-picked peer group** — the peer group is chosen to make the CEO look good
- **Lavish perks** (personal jet use, security details, club memberships, tax gross-ups) — these signal a CEO running the company for themselves
- **Massive grants regardless of performance** — golden parachutes, "retention" grants, repricing of underwater options
- **Pay growing while company performance shrinks** — the most damning tell

### Insider Ownership and Transactions

- **Heavy, sustained insider selling** — insiders sell for many reasons (diversification, taxes, divorce), but sustained selling by multiple insiders, especially during share buybacks, is meaningful
- **Open market purchases by insiders** — much rarer, much more meaningful in the *positive* direction. People buy stock for one reason: they think it will go up.
- **10b5-1 plans** — pre-set selling plans that are supposed to be neutral; abused when "amended" right before bad news

### Board Quality

- **Stacked with the CEO's friends, former colleagues, family members** — no one will say no
- **Long tenure with no turnover** — fresh perspectives gone
- **Multiple directorships (>4)** — the directors are not paying attention
- **No relevant industry expertise** — the board can't smell a problem

### Related-Party Transactions

A related-party transaction section listing the CEO's brother's company, the chairman's wife's law firm, or rentals from the founder's real estate holding is almost always bad. Sometimes it's small and innocuous; often it's the visible tip of a deeper self-dealing pattern.

### Frequent CFO Turnover

The single most diagnostic personnel signal. CFOs who quit "to spend more time with their family" right before a restatement is the cliché for a reason.

- Three CFO changes in five years: ask hard questions about why
- A CFO leaving simultaneously with the auditor: probably leave the stock alone
- A CFO who was a "rising star" suddenly demoted or sidelined: someone is being set up to take blame

### Auditor Changes

Companies change auditors. Most of the time it's normal. But:
- Changing auditors right before earnings season
- Changing from a Big Four to a smaller firm
- Disclosed disagreements with the prior auditor
…all are red flags. Look at the 8-K disclosing the change.

---

## 5. Capital Allocation Tells

Buffett: capital allocation is the CEO's most important job, and most CEOs are bad at it because they were promoted for being good at something else (sales, engineering, operations).

### Buybacks at All-Time Highs, Issuance at Lows

The opposite of what a rational owner would do. Many management teams systematically destroy value with timing this poor. Look at the average buyback price vs. today's price; if they bought at 2x today's level, that's value destroyed.

### Acquisitions as Strategy

- **Frequent acquisitions** with vague "synergy" justifications and no post-deal accountability
- **Roll-ups** that grow revenue via M&A but show declining same-store / organic metrics underneath
- **Acquiring companies in unrelated industries** ("conglomerate diworsification")
- **Friendly takeovers at high premiums** justified by "strategic rationale" rather than IRR

Buffett: "Most acquisitions are bad for the acquirer." If a company's growth story depends on continued M&A, the underlying business probably isn't growing.

### Dividend Funded by Debt

A company borrowing to pay dividends is liquidating itself for the appearance of returning capital to shareholders. Common in MLPs, BDCs, and "high-yield" stocks late in cycles.

### Cash Hoarding That Earns Less Than Debt Costs

Holding $5B in cash earning 3% while carrying $5B in debt costing 6% is a $150M/year unforced error. This either reflects laziness or fear of insolvency in scenarios management isn't disclosing.

### Reinvestment Rate vs Return on Reinvestment

A truly great business reinvests at high incremental returns on capital. A bad business reinvests at low returns, growing in size but destroying per-share value. Track:
- Return on incremental invested capital (ROIIC)
- Same-store / organic growth (excluding M&A)
- Free cash flow per share over time

---

## 6. Roll-up and M&A Tells

Roll-ups are a recurring vehicle for accounting bullshit. The pattern: buy companies, capitalize the acquisition costs, recognize "synergies" via cost cuts, present the consolidated entity as a growth story. Eventually:
- Quality of acquisitions drops as the easy targets are bought
- "Synergies" turn out to be one-time cuts that can't be repeated
- Goodwill writedowns expose the overpayment
- Stock collapses

**Tells:**
- Goodwill > 50% of assets
- Most "growth" is acquired, not organic
- Adjusted EBITDA used to make EPS look continuous
- "Pro forma" presentations that combine acquired entities as if the company always owned them
- Frequent debt refinancings as leverage stacks
- CEO's compensation tied to acquired EBITDA or deal count

**Examples in finance history:** Valeant Pharmaceuticals, Tyco (pre-restructuring), several health services and software roll-ups.

---

## 7. IPO and SPAC Tells

Buffett: "It's almost a mathematical impossibility to imagine that, out of the thousands of things for sale on a given day, the most attractively priced is the one being sold by a knowledgeable seller (company insiders) to a less-knowledgeable buyer (investors)."

In other words: IPOs systematically transfer money from buyers to sellers because the sellers know more than the buyers.

### IPO Tells

- Selling shareholders > primary issuance: insiders cashing out, not raising capital for growth
- Use of proceeds: "general corporate purposes" or "to repay debt" rather than specific growth investments
- "Risk Factors" section running 50+ pages (always worth reading the *first* page of risk factors — companies often signal real concerns there)
- Pre-IPO option grants accelerating to executives
- Lock-up expiry concentrations (be aware of when insiders can sell)
- Multiple recent down-rounds before IPO (priced for desperation)

### SPAC Tells

The structural economics of SPACs in the 2020-2021 vintage were systematically hostile to retail investors:
- Sponsor "promote" of 20% of shares for nominal consideration
- Warrants given to early investors that dilute later
- Two-year deadline to find a deal creates incentive to overpay
- PIPE financing terms often hostile
- De-SPAC projections have proven systematically optimistic and mostly missed badly

A SPAC pitch with a hockey-stick projection in the deck is not analysis; it's marketing constrained by no SEC liability for forward-looking statements.

---

## 8. Sell-Side Research Tells

### What sell-side ratings actually mean

The classic deciphering:
- "Strong Buy" → Buy
- "Buy" → Hold
- "Hold" → Sell
- "Sell" → run

The grade inflation is structural: sell-side analysts depend on company access for their job. A negative rating cuts off access. So negative ratings are rare, and even "Hold" is a meaningful signal.

### Sell-Side Tells

- Price target at 30% upside, perpetually 12 months out (the moving cookie)
- Target raised on stock price increase, lowered on decrease ("we are reflecting recent quote") — ie back-fitting the model to the price
- Estimate revisions consistently lagging actual results
- Refusing to acknowledge a clearly broken thesis ("we maintain our buy rating; near-term issues are transitory")
- Coverage initiated *just before* a banking deal (M&A advisor, IPO underwriter, secondary offering): the rating is part of the marketing
- Conference attendance: notice when analysts are wined and dined; reciprocity bias is real
- Investor day promotional tone — "this management team is best in class" type language

### What's often more useful than sell-side notes

- Short interest data (proxies for who is willing to actually bet against)
- Insider transactions (especially open-market purchases)
- The 10-K and 10-Q themselves (most "insights" in sell-side research are recycled from these)
- Conference call transcripts — read the *questions analysts asked*, not just the answers. The tough questions tell you what the smart money is worried about.

---

## 9. Macro & Market Commentary Tells

Most macro commentary is twaddle (Munger's term). If you must consume it, apply these filters.

### Forecasts as Fact

Buffett: "Forecasts may tell you a great deal about the forecaster; they tell you nothing about the future."

- "GDP will grow 2.3% next year" is presented with confidence none of these forecasts deserve
- The same forecasters were wrong in the same ways the prior year — go look
- Compare consensus forecasts of major variables (rates, GDP, oil) made 12 months ago to what actually happened. The dispersion is humbling.

### Stale Cliches Recycled

Each of these has been wrong multiple times and will be wrong again:
- "Money on the sidelines" (there are no sidelines; every share is owned by someone)
- "The Fed has our back"
- "Soft landing is now consensus"
- "This rotation is the real one"
- "X is the new Y" (NFTs are the new internet, AI is the new internet, crypto is the new gold)
- "It's a stockpicker's market"

### Skin in the Game

Anyone making a public market call should disclose their position. Most don't. The ones who do are usually more credible because they're paying with their own money.

### Contrarianism as Performance

Pundits who are "always bearish" or "always bullish" are not analysts; they're characters. Even a stopped clock is right twice a day. The eventual right call doesn't redeem the wrong calls.

---

## 10. The Buffett Filters — What Good Actually Looks Like

When applying skepticism, also know what passes. A company / investment / pitch that survives Buffett's filters has these features:

1. **Within your circle of competence** — you can explain why this works, in simple language, to a 10-year-old
2. **Durable competitive advantage** — moat. Brand, network effects (real ones), switching costs, low-cost production, regulatory protection. Test: would you confidently bet that this advantage exists in 10 years?
3. **Predictable economics** — earnings power that is reliable across business cycles. Not necessarily growing fast, but stable.
4. **Honest, capable management** — capital allocation track record over years (not promises). Insider purchases on the open market. Plain English in shareholder letters. Mistakes acknowledged.
5. **Strong returns on capital** — high ROE/ROIC sustained over time, achieved without excess leverage
6. **Conservative balance sheet** — debt that the business can service in a downturn, not just in good times
7. **Reasonable price relative to intrinsic value** — Buffett: "Price is what you pay; value is what you get." A wonderful business at a fair price beats a fair business at a wonderful price, but you still need a reasonable price.

If a pitch doesn't meet most of these — even if it has a great story, a charismatic founder, and a hockey-stick projection — it's a pass.

If a pitch *does* meet most of these — even if it sounds boring — it deserves serious work.

Boring is good. Boring is where most of the money has been made.

---

## How to Use This File

When the input is a financial / business pitch, walk through the categories that fit. Cite specific evidence: page numbers, specific line items, specific 10-K footnotes. Vague "this company has accounting issues" isn't useful. "Their adjustments to EBITDA grew from 8% of GAAP revenue in 2021 to 23% in 2023, with new add-backs for 'transformation costs' that the 2021 reconciliation did not contain" is useful.

The forensic discipline is the point.
