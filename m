Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63CF5311963
	for <sophgo@lists.linux.dev>; Wed, 28 Jan 2026 16:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769619371; cv=none; b=hy0iw0UUxu0hR+bOyc6zX5jb2UxVNxI29xFJJW5TB6J2AVHB2xfAwzzNHeaz1SD1v8CF9QBb9obaEyAWz+uzUJ2XxHyWAXYlJcAG5Apf+Hw96w69rlU0OvL1OlT6IE+CZfiD7SDiTnJ1bS2Zeis85hMDoUEABlZ7PCyjJMEY7lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769619371; c=relaxed/simple;
	bh=DFPbjUQCBuZxVY7EbLcJ1SV0eDTIkwQEvOof+ATB3fU=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=GG4poh4kl7KDulCxcEKkxs5DiHonGi4LTP+VmpDHM4AOLR7MQEC89TYEGW4cO+XLzuC1A0I2a+TjXtLAsSLE60oq7lBMYqCL0ED7AcqHxfWU3Uj3qx5jCVRfATNZFT1iNkB8dAthcwOlW3I2DxILujfiTYhvb8xua9tncDaLizk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=HM95gJQA; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=TZYWcJac; arc=none smtp.client-ip=202.12.124.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="HM95gJQA";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="TZYWcJac"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 6F9267A0178;
	Wed, 28 Jan 2026 11:56:08 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Wed, 28 Jan 2026 11:56:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1769619368;
	 x=1769705768; bh=kAoIuZ76fLX272MIHa0oK8kZGDIBNtwKi6fK+0P7sn4=; b=
	HM95gJQANENw47jSQmkrML24cc3LGnoiEMBwB52bjZE+894R6OadMW25fPUha70u
	rbfs0T4Gw/VSP1qG5//raxQwuCqYYLSHq7P8utIzHHVSK1UBPcCJVXlu9Aypn9GT
	yTPYED0BvawHxdmPeOXiNPbNowMvtVmCapEu0pOAEnB2RxxY+/ykYoPGr/hSomka
	a7qo2XifbhsMmjdOdOrjjBPhtyvac/tvvbuM2ybSvwMZo1Bdwhnm7jKholTpbs73
	T5g1IIpKnBuN/7Vwg1e+dv8fPeRnUt45yNGd4yFtVkcd+dzKkJE7aBNJAABB0vuH
	4tSxZe9G76QSwWFbLqv7ow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1769619368; x=
	1769705768; bh=kAoIuZ76fLX272MIHa0oK8kZGDIBNtwKi6fK+0P7sn4=; b=T
	ZYWcJac03Vm3VRGnq/HwAVKQsl+DmWw/W0ci3+LJG582H9q/1Gv1otzc/A7bFV6a
	7T6LY5lUG2PMV5n+NFvjzZqyhq7DuJfN/0fmE+sak5d5wdN904Tj09AEAJWjxfPV
	o4vNpGlwBjuZoKStIFEyIfTk1m63AmEtxw09DryANGShJY3llHOz0SCmQSpRYoSY
	q925ZWk2hWHC/rC9310E+YdGVnKvUdRY6UglHigYd9GpDYciSuK4g8q2qbW9XHq2
	sSv7zlrrlv04Awdd+rO8maKawN033WmWs5+NJILtrq07mYbIG8rQfTQuhtg91qxH
	t7w4EUcEMwEkSmCQfSM9g==
X-ME-Sender: <xms:qD96acyFM1TnuB98-t35jTIaudF5a1RqSHwa6wdAgTa9VgQAe9KDMw>
    <xme:qD96abETxD91J1mU6boT0IDzSIcJp5kJrpZ4GA3a_0tFuH0v3BAQ3PvG3sbdDRhjH
    i8-iCwt8ra0X6Vw6zgM_8SNdKcaatpCzBBfe3RbagR8DpQ_jcrzNQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduieefkeeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepkeehjedtjedtledtteegvdeiudduhefggfegudehfeekheduueehjefggedtuefg
    necuffhomhgrihhnpehgihhthhhusgdrtghomhdpghhithgvvgdrtghomhdpvddtvdegtd
    eivdefqdhhohifthhoqdhmrghinhhtrghinhgvrhdqlhhinhhugidrmhgupdhkvghrnhgv
    lhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopeekpdhmohguvgepshhm
    thhpohhuthdprhgtphhtthhopehinhhotghhihgrmhgrsehgmhgrihhlrdgtohhmpdhrtg
    hpthhtohepshhtrghvihhnshhkhiesghhmrghilhdrtghomhdprhgtphhtthhopegtohhn
    ohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhotgeskhgvrhhnvghlrd
    horhhgpdhrtghpthhtohepshhophhhghhosehlihhsthhsrdhlihhnuhigrdguvghvpdhr
    tghpthhtohepmhhitghhrggvlhesohhrlhhithiikhihrdgtohhmpdhrtghpthhtohepuh
    hnihgtohhrnhgpfigrnhhgsehouhhtlhhoohhkrdgtohhmpdhrtghpthhtohepghhuohgu
    ohhnghesrhhishgtshhtrghrrdgtohhm
X-ME-Proxy: <xmx:qD96abH5DB1SlvWkOWF7kZU9YSxmJJ9kRGxIq0KEfcycp6vRR4nacA>
    <xmx:qD96aSV08ChQutP0raDVpJ1CCGZQiVhXd0tRQzoD-mojHXk2jmT8xQ>
    <xmx:qD96aTxAFceFID1lYbkYw82sE9yACItEepI5lWgSsjnBZpvipcng5Q>
    <xmx:qD96aXQ_yvuCsQ25x9qY1lyD3tO9q82iEgpt3tA8ruGzvAyBIvYfiw>
    <xmx:qD96aS1gMtcWw4v3vlzvFzUpZrr6kqSzb4OAtFCov76jzl0Tsw_iAuvG>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id F04EB700065; Wed, 28 Jan 2026 11:56:07 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: A1tBEhR27o0V
Date: Wed, 28 Jan 2026 17:55:31 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Chen Wang" <unicorn_wang@outlook.com>, soc@kernel.org
Cc: "Conor Dooley" <conor+dt@kernel.org>,
 "Inochi Amaoto" <inochiama@gmail.com>,
 "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>,
 "Guodong Xu" <guodong@riscstar.com>,
 "Michael Orlitzky" <michael@orlitzky.com>,
 "Anton Stavinsky" <stavinsky@gmail.com>
Message-Id: <22023b9a-2a5b-4552-8d9f-3f15a7cc2ba8@app.fastmail.com>
In-Reply-To: 
 <MA5PR01MB12500D99CB14A37FBA543DD36FE96A@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
References: 
 <MA5PR01MB12500D99CB14A37FBA543DD36FE96A@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
Subject: Re: [GIT PULL] RISC-V Sophgo Devicetrees for v6.20
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 21, 2026, at 01:46, Chen Wang wrote:

> are available in the Git repository at:
>
>  =C2=A0 https://github.com/sophgo/linux.git tags/riscv-sophgo-dt-for-v=
6.20
>
> for you to fetch changes up to f16ae81b80ca4e721f4c4ed1f28390115f7721e=
b:
>
>  =C2=A0 riscv: dts: sophgo: sg2044: Add "b" ISA extension (2026-01-20=20
> 09:03:37 +0800)
>
> ----------------------------------------------------------------
> RISC-V Devicetrees for v6.20

Hi Chen,

I noticed that you are using a new gpg key. Like your old one, it
does not seem to be on the kernel.org keyring, but I actually
found the keyid in a blog post you wrote at

https://gitee.com/unicornx/tblog/blob/master/articles/20240623-howto-mai=
ntainer-linux.md#%E5%AE%89%E8%A3%85-gpg

so I successfully imported that key and verified the signature.

If you have the chance, it would be great if you could get other
developers to sign your key and upload it publicly, ideally on
the kernel.org keyring according to
https://korg.docs.kernel.org/pgpkeys.html

    Arnd
