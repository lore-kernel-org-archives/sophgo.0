Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F9418991E
	for <sophgo@lists.linux.dev>; Wed, 23 Jul 2025 05:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753248193; cv=none; b=TkKlsLvAkrwiq94AZ4HC+CmsH+/7gvs+zNpe/u/7EheTyy+6LjN4+UDGSbTXC6v8nuGL4EDsWZxaXyv8t4ntQbqViCgyPrlhf/JXYZACftFzjCjqEe1jjVbe5kYMNJXtoW8T5PhE1hRI7G92Z9S6eF71jeZq9riZRxZN7Y1ujXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753248193; c=relaxed/simple;
	bh=LXGKcOQhu+wPGvo+xwsCEALpCoiu5Z4bAdccYfJe5cY=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=f88XwfJZ1H0m04rNrELUOn/SHhNpZ+P+8Td0TAjZiqOZkEVudqOVn2NAcgIHtpN1g65Lxze4ap8I/utUdSAvYb592bDukg5Xm2/Q6m7NIIkWDspsAbhhFtyZa5cU+6aL+Srtnfqvcq+l2/oivNCI3DosrM87TnZ0kyv71LlhhIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=UP4oXmLO; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=JcnDzOdN; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="UP4oXmLO";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="JcnDzOdN"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 7D7641400225;
	Wed, 23 Jul 2025 01:23:08 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Wed, 23 Jul 2025 01:23:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1753248188;
	 x=1753334588; bh=CROXlFb8ogf4F7x6KgK3ulj+f+G9vusMA6l6kVGU2aE=; b=
	UP4oXmLOU2sC9ucq32q0KDguiqYORm8NtemlW58gw7yb6JE5uKShkTn3OE98EMi4
	pFhH8DrXT8QuUPnPsAHF0a6/LiATpFxJPtnzgfIstlSfEBdZ0FZETov4h/QIQJ+C
	Mx7WMX/7xxAkIuWBsyK+ioJUvny+VzqpmdsHgjcaF//uQ9oozh6FoalsZjrqYDlf
	MBALeIbks7Pj4PG8KTv5FawXajh8hfCcmkatBxIP4Gvd16ldeH8hdNfuaNM19hQu
	ySYrs4JOoPAx+37L0MULMOpydhJCsnFE00Hl0vER9x0SeE0q1giR1gsxQdQQKuOo
	8xdgPB8raYlAo8KggBCglQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1753248188; x=
	1753334588; bh=CROXlFb8ogf4F7x6KgK3ulj+f+G9vusMA6l6kVGU2aE=; b=J
	cnDzOdNUBVGvES7XdpSXUmKRIHWLQ7NcKB6bcyvsBSq6Pt5/mQm63sr8EID2w6Km
	93iGMOojgt9n7Zs4APaZKI3lCGLNRbtxKVpRHSHTJ38j/2ddwJrdcNPXZdWH0oa6
	E51PPW/TGF24TN/aByDjQjM0u3riV5ZPQYzw8Y2Cuyi7bNGj824ez62XG92x9Eup
	MQ8PYbSqepgIycv+cVgpWpw+mCC8WpgUiLZO9nHuMF1Gl039QS/leIrgWhNRgzxN
	mN5RzMNXGHMQGSLHhk1y7v28/f7lVfN57kRNIPA4TwzVxUZjvKnhVGWJ3PYBfLss
	V+EBgIvX3P2+WtDKSp2PA==
X-ME-Sender: <xms:vHGAaKpAcxwpWhGiZtTs2Y7HsQzZgasIixTnrS6LI7v9dng20zK7ZA>
    <xme:vHGAaIpg2floEUJLPabcoNZcwfrA2BNo1-upN_9nvX3xy5NneHObcWhwVBa2Hjr6J
    47BhO7FHA8d6NMoXnA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdejieelvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpeeggfejudejvdeijeeglefgtdfhudffieetfedugefhffekjeefhedtjeefjeetfeen
    ucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghp
    thhtohepledpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghlvgigrghnuggvrh
    drshhvvghrughlihhnsehgmhgrihhlrdgtohhmpdhrtghpthhtohepihhnohgthhhirghm
    rgesghhmrghilhdrtghomhdprhgtphhtthhopehlohhoohhnghdrsghinhesghhmrghilh
    drtghomhdprhgtphhtthhopehrrggsvghnuggrrdgtnhesghhmrghilhdrtghomhdprhgt
    phhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhotg
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishht
    shdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehsohhphhhgoheslhhishhtsh
    drlhhinhhugidruggvvhdprhgtphhtthhopehunhhitghorhhnpgifrghnghesohhuthhl
    ohhokhdrtghomh
X-ME-Proxy: <xmx:vHGAaDiYghFWgEZOAzZ1FhPsNT6PSiQOJSw9CB49JHB_H9eY2dBOzg>
    <xmx:vHGAaBkcBHbj0LinhHzkRNs1ZfT-nR8kPLqjU4ZN0GL0dT3tN3tWQQ>
    <xmx:vHGAaJZT1v0ojIWUsvMBExk5H7pNI-sWmLuUHnUrO7QOkYdY3B1f5Q>
    <xmx:vHGAaMGTSDlu5hNG49-S8XeTiVgS8CYWKENTCmEKXGt74nNS8UHyRw>
    <xmx:vHGAaDP-1Xj97rpIJ_1fcyWffcPrLKKtOz4TqWp9dKHsdHRuWyjBXOtU>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 329F9700065; Wed, 23 Jul 2025 01:23:08 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: T807ab912e45cbdf6
Date: Wed, 23 Jul 2025 07:22:47 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Chen Wang" <unicorn_wang@outlook.com>, soc@kernel.org
Cc: "Conor Dooley" <conor+dt@kernel.org>,
 "Inochi Amaoto" <inochiama@gmail.com>,
 "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 "Alexander Sverdlin" <alexander.sverdlin@gmail.com>,
 "Han Gao" <rabenda.cn@gmail.com>, "Longbin Li" <looong.bin@gmail.com>
Message-Id: <f8ca0ac4-9965-4fea-b9fd-47ab589792ba@app.fastmail.com>
In-Reply-To: 
 <MAUPR01MB110720B28DEDC03E9E9585833FE5FA@MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM>
References: 
 <MAUPR01MB11072115B8D6E3F2354840F5EFE56A@MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM>
 <217fec10-55f4-4a1b-a4a5-d498c42073a2@app.fastmail.com>
 <MAUPR01MB110720B28DEDC03E9E9585833FE5FA@MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM>
Subject: Re: [GIT PULL] RISC-V Sophgo Devicetrees for v6.17 (v2)
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Jul 23, 2025, at 04:25, Chen Wang wrote:
> On 2025/7/23 4:17, Arnd Bergmann wrote:
>> On Wed, Jul 16, 2025, at 02:31, Chen Wang wrote:

> According to your request, I have rebuilt two branches for PR (temporary):
> https://github.com/sophgo/linux/tree/temp-riscv-sophgo-dt-for-next
> https://github.com/sophgo/linux/tree/temp-arm-sophgo-dt-for-next
>
> Please check whether it meets your requirements. Both branches are based 
> on v6.16-rc1. If there is no problem, I will submit PRs using these two 
> branches respectively.

Thanks a lot for updating the contents so quickly, this all looks
good to me.

> It should be noted that about the commit "610f943a66be dt-bindings: soc: 
> sophgo: Move SoCs/boards from riscv into soc, add SG2000" on 
> temp-riscv-sophgo-dt-for-next. This change was originally made for 
> SG2000/ARM, moving sophgo.yaml from the riscv directory to soc/sophgo 
> for sharing between riscv and arm. Because this file will also be 
> involved in subsequent changes for riscv, I placed it in 
> temp-riscv-sophgo-dt-for-next.

Yes, that is fine. Technically what you could do here is to put this
commit on 6.16-rc1 first and then base both of the branches on
the same commit ID. We sometimes do this when there are hard
dependencies on a commit that otherwise prevent bisection. I don't
think it's necessary here.

     Arnd
