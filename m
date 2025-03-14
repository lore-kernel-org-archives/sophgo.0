Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA4D12B63
	for <sophgo@lists.linux.dev>; Fri, 14 Mar 2025 22:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741989968; cv=none; b=EI0PpHSPeYyrZBVI5aw4ov/Tg55iiUQJqgMKimtzpOJMh8KG9B0nCnJxWNxWjv99MZ1gPanRgAF4RvYOF95be7VZVCSXVynzapmVPR2e1iJ5NUs/0W5p3bDKWfrhQLTGAX2RdIUmzYcS4Ar1xCXienhaQ9EZ3ioxXTJm5Rnm3TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741989968; c=relaxed/simple;
	bh=5KnK5Gwu53ej6uBQH6br3pzW5SRNFRppqZd3YMaJtYw=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=WZjG34ynio2hO36Xhnu2aWzltHrv+roEWTQ8mKqaSwNuUzuowQfOlF4cnRrm+s3oCbgAshhPnIsj0Ol/tKUU34SAMz9gBTG+uREzkvtHfpsSRM1uvGF8beLTIH3ggK3zXvY96IwbdEh+rjYzZfOCHooT1SLnF/9RGWQ7xxkRczU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=L8XlQFRj; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=PUHUsyzz; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="L8XlQFRj";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="PUHUsyzz"
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfout.phl.internal (Postfix) with ESMTP id 67B0C1382DA3;
	Fri, 14 Mar 2025 18:05:46 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-07.internal (MEProxy); Fri, 14 Mar 2025 18:05:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1741989946;
	 x=1742076346; bh=uoQvjhMmNQg10emVMUUVDGU0v2uRuDY9lOGERp/ZUZk=; b=
	L8XlQFRjBtg+uePPnQAcCavtnZJvYBShZu2eQ0eT1NMU/auMd6Aou88gSNLbrP1S
	6Bm4yAY7+ZMQZd6CCAhdnMFDhrGlwdpbop58acBfPPtnXTcUZtzEJjVBRJjhJD5B
	sk5vrLgrjr+USsQhPBCg5qyvH0hhPf5udu9SnKFfRW1+5VhVE5vB2sW1HRNh4Q8s
	hVaA7lJFsYGx3RhneVKpHEsvsvcOzvG7W8R38mptJCtkxxj9qi/TBAizY0EgRS4i
	OSiNmaN0cFuoXiyICRxSHRl5Iq/PWsMavKcfhN8NTjQwo95Su2wT1VHmpEs9NpUL
	kxwc+Uq1HQVnSASTtx+Suw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1741989946; x=
	1742076346; bh=uoQvjhMmNQg10emVMUUVDGU0v2uRuDY9lOGERp/ZUZk=; b=P
	UHUsyzzLUsROGybmyLVc+5v9Yv5LNhz6F4vuBk4B4bFn5GzC5HpEOoW8AhA94P//
	U16cXUE1qo51otrAM59YI4XmdgcJncasrilFDFoZj0BOR+8FTI6II14w4+PldGML
	X0YswS1eMPopg28+ohCAvqut6Jy4pZPWmkMiRf0aUxXGHDQZ2bVT+oEAPA+u4j3j
	HozbFbPB6OM2d/r8/MAriX06WRsmgV7Z29ZXob9238E7tfPuiic8skrPjH8AUZuL
	mcGondW7YlwW4fNki1mgh+uTMa1/jt8+oJni5bhbl/Tpta58Aoa3/G75+/gYNTya
	WZu7YxUBgkou1iTwXABkg==
X-ME-Sender: <xms:OKjUZ20wYyzvXBU5C-J2oeM8CwPZILEzyDDL_mckZ3alPUSzeSLZIQ>
    <xme:OKjUZ5GoL3Ya_YNry2k0F9Ppoe4wv6uex65hu6Q69ktc1Ocfnmd2nEQihC_VWAT6S
    _NYBhie2OH9asgDEsM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddufeduleekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertder
    tdejnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhepvdfhvdekueduveffffetgfdvveefvdelhedv
    vdegjedvfeehtdeggeevheefleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    ledpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepihhnohgthhhirghmrgesghhmrg
    hilhdrtghomhdprhgtphhtthhopegtohhnohhrsehkvghrnhgvlhdrohhrghdprhgtphht
    thhopehsohgtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhhsrdifrghllh
    gvihhjsehlihhnrghrohdrohhrghdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehl
    ihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepshhophhhghhosehlih
    hsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtohepuhhnihgtohhrnhgpfigrnhhgseho
    uhhtlhhoohhkrdgtohhmpdhrtghpthhtoheptghhrghordifvghisehsohhphhhgohdrtg
    homhdprhgtphhtthhopeigihgrohhguhgrnhhgrdigihhnghesshhophhhghhordgtohhm
X-ME-Proxy: <xmx:OKjUZ-5jyT6VLmZzgnIYR9eHBYWNF3wz5umQ1vAlbB323zNfuwhlXQ>
    <xmx:OKjUZ33M0nPUV9kgZr1VArOxsoBmf9GSO6a8-axDbckSaLA43PdNLg>
    <xmx:OKjUZ5Ej-dkLf40_JE3DgUMQKlSGuMqXPG1EoY_rzkmgrofP7DqwvQ>
    <xmx:OKjUZw8Hm60nNyP4Bd2bwpLzIunTGOwvw22JvER9DhKKhL3LJmFS4w>
    <xmx:OqjUZ_YjcUPLzW07JAK3eMGa0wraXUdWx33jHm90vQH9_U1pDxTJoy7h>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 59A7E2220072; Fri, 14 Mar 2025 18:05:44 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Fri, 14 Mar 2025 23:05:23 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Chen Wang" <unicorn_wang@outlook.com>, soc@kernel.org,
 "Linus Walleij" <linus.walleij@linaro.org>
Cc: "Conor Dooley" <conor@kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 "Inochi Amaoto" <inochiama@gmail.com>,
 "Xiaoguang Xing" <xiaoguang.xing@sophgo.com>,
 "Chao Wei" <chao.wei@sophgo.com>, sophgo@lists.linux.dev
Message-Id: <f65bba9b-726e-469a-8657-693bb640d75b@app.fastmail.com>
In-Reply-To: 
 <PN0PR01MB1039398834809EEFB83AD25F5FED12@PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM>
References: 
 <PN0PR01MB1039398834809EEFB83AD25F5FED12@PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM>
Subject: Re: [GIT PULL] RISC-V Sophgo Devicetrees for v6.15
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 11, 2025, at 08:15, Chen Wang wrote:
> Hey Arnd,
>
> Please pull dt changes for RISC-V/Sophgo.
>
> Please note that in the commits I submitted, I merged a branch ib-soph=
go=20
> from Linus Walleij (see [1]).=C2=A0 because pinctrl's dts patch depend=
s on it.
>
> So among total 13 commits, the following 5 patches are the actual=20
> patches to be submitted in this PR, others are merged from the branch=20
> ib-sophgo.
>
> 5277657d5383 riscv: dts: sophgo: sg2042: add pinctrl support
> f047a9285f9f riscv: sophgo: dts: add cooling maps for Milk-V Pioneer
> 62cdf0a06dd5 riscv: sophgo: dts: add pwm-fan for Milk-V Pioneer
> 8630ed6f2adc MAINTAINERS: update info for SOPHGO DEVICETREES and DRIVE=
RS
> 255f83ba5c16 riscv: sophgo: dts: add pwm controller for SG2042 SoC
>
> I'm not sure if this is ok for you, any questions, please feel free le=
t=20
> me know.

Sorry, I can't take it this way in the soc/dt branch, since I want
to have only devicetree changes in that.

Normally there should not be any dependencies because you
the device tree is meant to remain compatible, so anything
that worked before the changes should keep working after
them.

Are you actually doing incompatible changes here, or is this
just about the DT binding?

>  =C2=A0Documentation/devicetree/bindings/pinctrl/sophgo,sg2042-pinctrl=
.yaml |=20
> 129 +++++++++++
>  =C2=A0MAINTAINERS |=C2=A0=C2=A0 4 +-
>  =C2=A0arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=20
> 108 +++++++++
>  =C2=A0arch/riscv/boot/dts/sophgo/sg2042.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=20
> 15 ++
>  =C2=A0drivers/pinctrl/sophgo/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=20
> 46 +++-
>  =C2=A0drivers/pinctrl/sophgo/Makefile |=C2=A0=C2=A0 8 +-
>  =C2=A0drivers/pinctrl/sophgo/pinctrl-cv1800b.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=20
> 27 ++-
>  =C2=A0drivers/pinctrl/sophgo/pinctrl-cv1812h.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=20
> 27 ++-
>  =C2=A0drivers/pinctrl/sophgo/pinctrl-cv18xx.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=20
> 602 ++++++++++++--------------------------------------

You have overly long lines here, probably from copy-pasting the pull
request from a shell in a wider window. To fix this part, you can pipe
the output of 'git request-pull' into another command, e.g. 'xclip'
or simply 'cat'.

      Arnd
