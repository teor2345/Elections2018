# Possible Vote Disclosure in ACT Elections

It might be possible for people to link Australian Capital Territory (ACT)
voters and their votes from previous elections (2001-2016).


## Background

> At the 2016 election, the Commission built upon the achievements of the 2012
> election. Of particular note was the upgrade of the electronic polling place
> management system, incorporating the networked marking of names of voters on
> electronic electoral rolls across all polling places and electronic
> transmission of results on polling night, and the provision of electronic
> voting to around 1 in 3 of all ACT voters.

Source: [Report on the ACT Legislative Assembly Election 2016], Page 1

[Report on the ACT Legislative Assembly Election 2016]: https://www.elections.act.gov.au/__data/assets/pdf_file/0016/1044016/Report-on-the-ACT-Legislative-Assembly-Election-2016.pdf "Report on the ACT Legislative Assembly Election 2016"


## Vulnerability Summary

Three related vote disclosure vulnerabilities exist in the ACT's election
systems:

- **V1:** A voter can publicly prove that they voted a certain way using an
          electronic or paper vote (2001-2016).

- **V2:** A public observer may be able to link a small number of voters to
          their electronic votes (2001-2016).

- **V3:** A person can link many voters to their votes, if they gain access to:
  - previously collected detailed electronic vote data (2001-2016), and
  - detailed data about an individual's polling time or polling order.
    For example, the polling time may be collected when marking off electronic
    electoral rolls (2008-2016).

All three vulnerabilities are theoretical: there is no evidence that any of
them have been used to reveal any votes.


## Recommendation Summary

The data collected at future ACT elections should be minimised. If particular
data is not required to conduct the election, it should not be collected.
This ensures that no-one is capable of linking voters to their votes, even if
they have access to all the election data.

In particular, electronic electoral rolls, electronic voting, and surveillance
systems should be checked to ensure that they do not collect the timing or
order of votes.

Even with these precautions, individual vote preference data should not be
published for future elections. Other detailed statistics should be minimised.

Details of the design and operation of of electronic electoral rolls,
electronic voting, and surveillance systems should be made public. Publishing
these details should improve public confidence in the ACT's election systems.


## Detailed Recommendations

To address these vulnerabilities, ElectionsACT should:

- **R1:** Remove all publicly accessible individual ballot paper preference
          data from previous elections. This includes the detailed paper vote
          and electronic vote data published on the ElectionsACT website.
          For example: [2016 detailed vote data]
          (**V1**, **V2**)

- **R2:** Do not publish individual ballot paper preference data for future
          elections.
          (**V1**, **V2**)

- **R3:** Do not publish voting statistics about small groups of voters,
          particular polling places or methods, or the votes on particular
          days.
          (**V1**, **V2**)

- **R4:** Restrict observation of the order and timing of voters
          entering, voting, and leaving polling places.
          For example:
  - Ban personal electronic devices in polling places
  - Disable surveillance cameras in or around polling places
  - Increase the exclusion zone around polling places
          (**V2**, **V3**)

- **R5:** Destroy all detailed records that could reveal voter actions in or
          around a polling place. Destroy surveillance records such as
          those in **R4**.
          (**V3**)

- **R6:** Remove any details in electronic voting records that could reveal
          vote order or vote timing. In particular, remove the vote timestamps
          and sequential vote ids collected by the current eVACS (electronic
          voting and counting) system. Then randomise the storage order of the
          votes. See also the [electoral paper disposal legislation].
          (**V3**)

- **R7:** Remove any details in electronic roll marking records that could
          reveal roll mark timing or order. Remove any fields similar to
          those listed in **R6**, and shuffle the data.
          (**V3**)

- **R8:** Ensure that future electronic voting systems do not collect any more
          vote information than a paper voting system. In particular, do not
          collect any fields similar to those listed in **R6**. To emulate the
          behaviour of paper votes in a ballot box, shuffle the order of the
          votes before transmission or storage.
          (**V3**)

- **R9:** Ensure that future electoral roll marking systems do not collect any
          more information than a paper electoral roll. In particular, do not
          collect any fields similar to those listed in **R6**. To emulate the
          behaviour of marking off voters on paper, shuffle the order of
          marked-off voters before transmission or storage.
          (**V3**)

- **R10:** The [2001 audit] focused on the correctness of the eVACS system.
           Future voting system audits and reviews should take a systems
           approach, rather than focusing on individual pieces of software, or
           isolated sets of data.
           It is unclear whether there was an audit of electronic electoral
           roll marking. When new technologies are adopted, audits should be
           updated, and new reviews conducted.
           (**V1**, **V2**, **V3**)

- **R11:** Publicise enough information about the detailed design of future
           ACT voting systems that scrutineers, researchers, and other
           interested members of the public can verify their security.
           This should include publicly available source code, like the
           [eVACS source code]; and publicly available design documents.
           (**V1**, **V2**, **V3**)

[2016 detailed vote data]: https://www.elections.act.gov.au/elections_and_voting/past_act_legislative_assembly_elections/2016-election/ballot-paper-preference-data-2016-election "Individual Vote Preference Data for the 2016 ACT Election"

[electoral paper disposal legislation]: http://www.legislation.act.gov.au/a/1992-71/current/pdf/1992-71.pdf "Electoral ACT 1992, 335 Storage and destruction of electoral papers"

[2001 audit]: https://www.elections.act.gov.au/elections_and_voting/electronic_voting_and_counting/development_of_the_system "Development of the system: Auditing"

[eVACS source code]: https://www.elections.act.gov.au/elections_and_voting/electronic_voting_and_counting "eVACS Source Code, 2001-2016"


## Detailed Vulnerabilities


### **V1:** Public proof of electronic or paper votes

*A voter can publicly prove that they voted a certain way using an electronic
or paper vote (2001-2016).*

All paper and electronic votes for the 2001-2016 elections are available
online (for example: [2016 detailed vote data]). If a voter chooses an unusual
arrangement of preferences, they can link their vote to a publicly available
record. It is possible to choose unusual preferences without affecting which
candidates are elected by a ballot.

In the 2016 election, 5 members of the Legislative Assembly were elected from
each of the 5 ACT electorates. But each electorate had between 24 and 33
[candidates]. Therefore, each voter has at least 19 preference choices that
will not affect the outcome of the election. The number of possible
combinations of these irrelevant preferences is:

```
    19! = 121,645,100,408,832,000
```

The number of voters in each ACT electorate in the [2016 election] was:

```
    48,238 - 52,500
```

Therefore, any unusual preference combination is very likely to be unique.
(The analysis is similar for the 2001-2012 elections.)

For example, a voter could spell out their own name using the first or last
initial of their lowest-preferenced candidates. It is also possible to design
unusual votes that:
- blend in with typical voting patterns, or
- can only be identified by people who know a secret preference pattern.

[candidates]: https://www.elections.act.gov.au/elections_and_voting/past_act_legislative_assembly_elections/2016-election/list-of-candidates "2016 ACT Election Candidates"

[2016 election]: https://www.elections.act.gov.au/elections_and_voting/past_act_legislative_assembly_elections/2016-election/2016-election-results/results-overview "2016 ACT Election Results"


### **V2:** Publicly linking voters to their electronic votes

*A public observer may be able to link a small number of voters to their
electronic votes (2001-2016).*


#### Identifying Vote Order

All paper and electronic votes for the 2001-2016 elections are available
online (for example: [2016 detailed vote data]). Each [ballot paper record]
contains:
- pindex: a unique, sequential identifier for the vote
- batch: the polling place batch number, which is linked to the:
  - electorate, and
  - polling place
- details of the voter's preference for each candidate.

Some details of these fields can be determined from the
[2016 eVACS source code]. For example, vote ids in the \*_confirmed_vote
tables are allocated sequentially by \*_confirmed_id_seq. (See
evacs/setup_election/setup_phase1.sh) But does the code that outputs the
public ballot paper records put these ids in the pindex field?

If the pindex field is a sequential id, it reveals the order of electronic
votes. (It does not reveal the order of paper votes, because paper vote order
is not preserved in the ballot box, or during counting.)

This publicly available data lets anyone guess the first and last votes at a
polling place. The first and last votes in each batch at each polling place
can also be identified.

[ballot paper record]: https://www.elections.act.gov.au/__data/assets/file/0003/1002639/DataDescriptions.pdf "2016 ACT Election Data Descriptions"

[2016 eVACS source code]: https://www.elections.act.gov.au/__data/assets/file/0010/988687/evacs2016.zip "Source code for 2016 eVACS software"


#### Linking Votes to Polling Order

A voter's electorate can be determined from their address. Knowing a voter's
suburb or general locality is usually enough to find their electorate.

Polling place locations and opening dates are publicly available. Therefore,
it is relatively easy to observe the first and last voters voting for each
electorate at a polling place. Assuming that the publicly released votes are
listed in polling order, this allows an observer to identify someone's vote
with reasonable certainty.

If batch numbers change on a predictable schedule (for example, every day, or
after a certain number of votes), then more voters can be linked to their
votes. It would be possible to observe the first and last voters in every
batch, for every polling place, and every electorate.

Once a few voters have entered a polling place, it becomes harder to work out:
- the exact order in which people voted,
- if they actually voted or not,
- whether they voted on paper or electronically.

This polling order uncertainty makes it hard to link votes and voters outside
the first few and last few votes, per polling place, electorate, and possibly
per batch.

The uncertainty can be reduced if an adversary only cares about the order of
preference of the major parties. If the first few votes all preference the same
major party, then it is very likely that the first few voters voted for them.


#### Further Analysis

It is unclear:
  - if the order of public vote records is the same as the order they are
    collected in. The code that exports public vote records doesn't seem to
    be in the [2016 eVACS source code].
  - if batch numbers change on a predictable schedule.
 -  if the batch numbers in the public vote records as the same as the batch
    numbers that are collected. The public batch numbers don't seem to match
    the format in the eVACS source code or [ballot paper record] descriptions.


### **V3:** Linking voters to votes using detailed electronic vote data

*A person can link many voters to their votes, if they gain access to:*
  - *previously collected detailed electronic vote data (2001-2016), and*
  - *detailed data about an individual's polling time or polling order.
     For example, the polling time may be collected when marking off electronic
     electoral rolls (2008-2016).*


#### Identifying Vote Times

The time of each electronic vote in the 2001-2016 elections is stored by
eVACS, to the nearest second. (The [2016 eVACS source code] implements these
timestamps in evacs/voting_server/save_and_verify.c and evacs/common/evacs.c.)

The eVACS system collects precise timing of each vote, along with all the
preferences in that vote. Access to this data is normally restricted. But it
could be possible for someone to gain unauthorised access to it.


#### Linking Votes to Polling Order

Anyone who gains access to precise vote times can compare them with
publicly observed vote order, as described in the section
"Linking Votes to Polling Order". The detailed times make it easier to link
votes to particular voters as they are observed throughout the day.

Other methods could also be used to determine polling order, such as those
listed in **R4**.


#### Linking Votes to Polling Times

The time that each voter was marked off the electronic electoral roll may have
been collected in the 2008-2016 elections. Each election appears to have used
a different system, the latest system is described in the
[Report on the ACT Legislative Assembly Election 2016]. (The 2001 and 2004
elections used paper electoral rolls.)

ElectionsACT does not provide many public details about electronic electoral
rolls. It is possible that these systems collect the precise time that each
voter is marked off the roll. If this data exists, access to it is likely
restricted. But it could be possible for someone to gain unauthorised access.

It is also possible that video surveillance of voting booths could identify
the precise time at which someone swipes their barcode to register their vote.
ElectionsACT does not provide many public details about surveillence in or
around polling places. The presence of cameras likely varies by polling place.

Anyone who gains access to precise vote times, and precise polling times, can
link votes to voters. These precise times allow an adversary to be certain
about which votes belong to which voters.


#### Further Analysis

It is unclear:
  - how much detailed electronic vote data is stored,
  - which details are collected when electronic electoral rolls are marked,
  - how much of this detailed electronic electoral roll data is stored,
  - if there is any surveillance footage that may reveal individual polling
    times or polling orders.


## Acknowledgements

I want to thank the staff of ElectionsACT and Software Improvements for their
assistance in disclosing and analysing these vulnerabilities.

It would not have been possible to confirm **V2** or discover **V3** without
access to the eVACS software source code. I want to express my appreciation
to ElectionsACT and Software Improvements for choosing to make the code public
so that people can review it.

## Author

T Wilson-Brown, Independent Security Researcher, August 2018
(they/them pronouns)
