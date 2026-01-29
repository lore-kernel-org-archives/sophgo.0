Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3277E1E1DE9
	for <sophgo@lists.linux.dev>; Thu, 29 Jan 2026 06:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769668810; cv=none; b=KQwzR44GKS7ZNKK0RvO+dYYjxrcbDebWoMCAnOAmdT15N+C5RPpCkXVPAg4mZQv+gWhf5DA0VtbMJ6n8q99La01w2AF4RnoZCYIBlLV57vZyIYF83lbtIrK9XpqNJKfo4KHuAMCrwezBkrXVwmsNxrW1+l3rbHMca7BLLRKrZS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769668810; c=relaxed/simple;
	bh=/a6/wd6OuG645sdbAFqYxz71j5XtEs/kvCzvQVhsl8s=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=ZW/kGUiW7p1CDNdh7cMQS9XCJULfTglBH13qrgdNr7r/wZ2uwYGIhbymeUkREuArCdtG8wsfdv8zCQPjWa5lGO8MNFX9v4vHk+jCcteEXKIqWR76kh3+FDtd9yt5MBFRZ4RWQFPZU2aujIem650c+J9k6QOTeYBQhvqBcKQAkgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=CzTwI6tS; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=pZLLfY+g; arc=none smtp.client-ip=202.12.124.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="CzTwI6tS";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="pZLLfY+g"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id E12877A0164;
	Thu, 29 Jan 2026 01:40:06 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Thu, 29 Jan 2026 01:40:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1769668806;
	 x=1769755206; bh=kmfzuhitRSBF0ik6bF9Poor94mbpsc1mmyQuIeYVP1A=; b=
	CzTwI6tS3LruuRItwOY+5LalCdVKi/yo9/9lRrCBWj+iGsOyUQOFwgIfOuScFCAz
	Nqh75t52pq02hVoNwo3ThF0PJe67jq5kXWplZQmlaWApRzP4UD1JfUKWrKuzCMMh
	TzrWbsFz/XUfPlvovh1w/OOWGQPqJwRhfTw4n2kkAcMK68ThXhpoXzIgL+zxxE2b
	YMcqVxChxHyjumKw5yqGt3Uo+ZI56sQ6c0Q9s8+C1MXRJK8zJzE+r3wn/7TquYT9
	h/nVs/F/JXwI1eBHpzwdKaPnvYFOCG1xpcgLyuNgjG0pIT87HgX3/LVTz3RPvjHX
	q2WhA8Rd41YNYu/rFEAO5A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1769668806; x=
	1769755206; bh=kmfzuhitRSBF0ik6bF9Poor94mbpsc1mmyQuIeYVP1A=; b=p
	ZLLfY+gC0vocPHOCgl0uw0FH45d4gc4iral1k8jyPSPagbavZjUHjcGXHxUK30Uc
	OHu31w970X0tc5RuCfbdlFcfrLG2rKP1HPAGtvqY4l81uaRiRVJm6lzzMEmMwY6D
	K1yXkPH/cMx9GV8gTSysXZ8B3VrSP/ODmz0WrPtlVF+GEzWvCzMUWckeeSh9FQnJ
	j/QLVB75yn44MTPvcHFiI1aNBed4agWMT5+mFyV0OHafS1JINFimOzLHJ6gt+p22
	YjGL58k4qqrdsEVkkhV8tdQih0Xt2OZ//dRUI9vuKKvfrvmyvNiifQ+0nrSq2Xlo
	7AiLQE45vxZ2IfBQSVQpw==
X-ME-Sender: <xms:xgB7aQ62aNRZ_YUBhxMXmn4xD9vbg8FupPawvOJxA-a1eqC9Dn1Mcg>
    <xme:xgB7acvrnFjJT9UoXWosv2zFhtB9NyVDvglJ0HsveG1Os1n6OSFhpWZyBOwzwmMph
    09CLUpLlQjW3mbfqeDImRqjY3azGY3IZgqHp0CBkEx6JC_-hS6hR0E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduieehhedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepieelueehgeeljeeijeeljeevfeeuheffudelhefhgeekieefveekhfdvjefhffev
    necuffhomhgrihhnpehgihhtvggvrdgtohhmpddvtddvgedtiedvfedqhhhofihtohdqmh
    grihhnthgrihhnvghrqdhlihhnuhigrdhmugenucevlhhushhtvghrufhiiigvpedtnecu
    rfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtph
    htthhopeekpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehinhhotghhihgrmhgr
    sehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhtrghvihhnshhkhiesghhmrghilhdrtg
    homhdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthht
    ohepshhotgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhophhhghhosehlihhsth
    hsrdhlihhnuhigrdguvghvpdhrtghpthhtohepmhhitghhrggvlhesohhrlhhithiikhih
    rdgtohhmpdhrtghpthhtohepuhhnihgtohhrnhgpfigrnhhgsehouhhtlhhoohhkrdgtoh
    hmpdhrtghpthhtohepghhuohguohhnghesrhhishgtshhtrghrrdgtohhm
X-ME-Proxy: <xmx:xgB7aZMhOhStoz9YhaBdoOL6jbM6nSlxMJhYfZ1Tyla8in154dnMqA>
    <xmx:xgB7aV97V7kl9touu0mdkSPLkj372S-sGtvMexKIL9KJ_QZtNbuGPw>
    <xmx:xgB7ae5v6ciPZeBplgFLtBdGZy9wTJjE3wcOUeU56rild40eeuUxBg>
    <xmx:xgB7aT56FLq-lpdNrWNEpeCgd211fDPdUfGUtfsl8NV1bb0515Ug7Q>
    <xmx:xgB7adTNt9xB02Q8YdJVbVgisA1G5rCA-NwHko_8aGp5hUfUW2LHY7Np>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 7232A700065; Thu, 29 Jan 2026 01:40:06 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: A1tBEhR27o0V
Date: Thu, 29 Jan 2026 07:39:45 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Chen Wang" <unicorn_wang@outlook.com>, soc@kernel.org
Cc: "Conor Dooley" <conor+dt@kernel.org>,
 "Inochi Amaoto" <inochiama@gmail.com>,
 "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>,
 "Guodong Xu" <guodong@riscstar.com>,
 "Michael Orlitzky" <michael@orlitzky.com>,
 "Anton Stavinsky" <stavinsky@gmail.com>
Message-Id: <9e5d30f7-34cf-4bba-bd19-c0ae09ac4219@app.fastmail.com>
In-Reply-To: 
 <MA5PR01MB125009818CC3F8C36C602B83FFE9EA@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
References: 
 <MA5PR01MB12500D99CB14A37FBA543DD36FE96A@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
 <22023b9a-2a5b-4552-8d9f-3f15a7cc2ba8@app.fastmail.com>
 <MA5PR01MB125009818CC3F8C36C602B83FFE9EA@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
Subject: Re: [GIT PULL] RISC-V Sophgo Devicetrees for v6.20
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Jan 29, 2026, at 01:33, Chen Wang wrote:
> On 1/29/2026 12:55 AM, Arnd Bergmann wrote:
>> On Wed, Jan 21, 2026, at 01:46, Chen Wang wrote:
>>
>> I noticed that you are using a new gpg key. Like your old one, it
>> does not seem to be on the kernel.org keyring, but I actually
>> found the keyid in a blog post you wrote at
>>
>> https://gitee.com/unicornx/tblog/blob/master/articles/20240623-howto-maintainer-linux.md#%E5%AE%89%E8%A3%85-gpg
>>
>> so I successfully imported that key and verified the signature.
> You're amazing! You even found this! :)

I only googled the key ID and this was the only hit ;-)

    Arnd
