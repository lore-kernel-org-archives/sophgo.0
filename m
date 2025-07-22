Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5951527FD54
	for <sophgo@lists.linux.dev>; Tue, 22 Jul 2025 20:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753215513; cv=none; b=KIzzbfx67LAFai5VEgmZpwJyLHRPHBT2N9js9MytVwGTeENHnpnIMib0DBTSuBkr+AbhuneOFSA1riw9YZkPN0IRAg26md+zXuvzSpRVqdgvIHNp1apGD3b/NrcVvTHSbo5U9bXs85b//Hztf+yVqWZ/TavULmuTfBTKKhal1Es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753215513; c=relaxed/simple;
	bh=ul2iph6gwhI/I7Vati2UqiLQr9SIyEBpS6b3lsRBI/Q=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Cwlj82iCdEeYhtym7gojWO44MxBR6xN9o/Dq33f9C8gnglM5mOdGYb1H+oiyolVJue0lYlQpiNLnmJeXsZSuNRNBMiufBgHr+tyofoAl/+cC+dtJ3feANoDh4q8OeMR18LcQUiHYlXqh4oPd3umHzbv6OBqg5bGWP7pMcnZb1Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=RD14oLRq; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Yp8M1S4U; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="RD14oLRq";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Yp8M1S4U"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 69C67EC057F;
	Tue, 22 Jul 2025 16:18:30 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Tue, 22 Jul 2025 16:18:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1753215510;
	 x=1753301910; bh=Ue3hOiZOTBwNx3gp3nlcLSOvWzsJyJAf9xZ1igy2wnM=; b=
	RD14oLRqFXYooq1HxJfFoI4GadRvd/tfyliOB62bB/tqyoOgqFAvCT1PngexCDcj
	vL0ztESxc35WTtHCgAoqURyN6rSlWV6UBD4jB7NVk9hwGdg+mYi7UTHOOC3tiddr
	MTY0qmuqTt/t2yDvuXVv1xtF6Hzj+ESYY36W5YVjecXFJD2Y9qtCePj1UUdnbq8r
	xtWaoVu6wNVKuvI1Vs9IlD+Ls3lDv4/YNptJPS7svS2HcHdDP+6tWDaVPNwn6B2P
	1+4aeyDSgi1pFD4dttKHz5B1vG0CgzckSRaexlKHKVeNKWJ5lZU8z0Vlu/DQIJwP
	t0ILxhlN4uciikNa9dmuag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1753215510; x=
	1753301910; bh=Ue3hOiZOTBwNx3gp3nlcLSOvWzsJyJAf9xZ1igy2wnM=; b=Y
	p8M1S4UUSF+b7g0C3Ej0shzc4n816mtxBVGbrDZi56JW9EasHbufvReMTv0Iz57V
	vxNfLzkzG1iMmGq74lYyz/cx+w4qmvP6Jn8evdUlnkPM6fbPByfLYMeCHhedDzW6
	AXWGoKLJeSmNVzd5FELjsu2lHuVBXrIf0GJsSr57uORe1bOV33y8o6yzjx9+/7cm
	SNf8/qylJEmXMTDLRtnriZcJfSinm0KhM8sfy/FG4ArlJStdos/b4LvvEFrxOs9w
	tJyw1WL7t63PxqPilksHpFFRPNP6Uq7q0xHB70lVdv/WV7AMVUZPFqzoDG/bomXn
	c3ANuy422wxKy0GcERxGQ==
X-ME-Sender: <xms:FfJ_aHq1oXerL_j49jUbU7ITWARIc_x-M4Gyo-cUHuokCO5OmDPStA>
    <xme:FfJ_aBr9U5mgFibdRadpW6zZZPSnYycTpeGA4O4dtMzRBzUuDRkaOtHHoQe4GhIKF
    1OR4_tnkXfz1Cd1LPE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdejheekfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpeetfeduheevuddtuefgueevffeludehheefheffueejudelvdehiedvffelffejtden
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
X-ME-Proxy: <xmx:FvJ_aAiwYjrHcNNTfmKV2tv-dDBHob2hPztuW0vyr22F9uGyaouhIw>
    <xmx:FvJ_aKkfk4b_CJdAnhr1mnU5CZoEniDJ2ciK89GnwfNGAF4sY_OXLw>
    <xmx:FvJ_aOY3rrCY6HHa5Qtl7y2wvOWILQBoGsagw7S5QvF5DnGtEeml2g>
    <xmx:FvJ_aNGpFDCdakfFael6fJDf8ojRtvLd-mB3CVH20qxxthD9pVW0OA>
    <xmx:FvJ_aIODzRhOYzF843q6AJgK0Gaj5TAyxFsnGaQewSVO4xtlo5kYNnD0>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id E675A700065; Tue, 22 Jul 2025 16:18:29 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: T807ab912e45cbdf6
Date: Tue, 22 Jul 2025 22:17:59 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Chen Wang" <unicorn_wang@outlook.com>, soc@kernel.org
Cc: "Conor Dooley" <conor+dt@kernel.org>,
 "Inochi Amaoto" <inochiama@gmail.com>,
 "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 "Alexander Sverdlin" <alexander.sverdlin@gmail.com>,
 "Han Gao" <rabenda.cn@gmail.com>, "Longbin Li" <looong.bin@gmail.com>
Message-Id: <217fec10-55f4-4a1b-a4a5-d498c42073a2@app.fastmail.com>
In-Reply-To: 
 <MAUPR01MB11072115B8D6E3F2354840F5EFE56A@MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM>
References: 
 <MAUPR01MB11072115B8D6E3F2354840F5EFE56A@MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM>
Subject: Re: [GIT PULL] RISC-V Sophgo Devicetrees for v6.17 (v2)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 16, 2025, at 02:31, Chen Wang wrote:
> Hey Arnd,
>
> Please pull this dt changes for RISC-V/Sophgo. This PR is the=20
> replacement of the old one [1].
>

Hi Chen,

I just tried to pull this but still see a few issues that I hope
you can improve first:

> The following changes since commit 347e9f5043c89695b01e66b3ed111755afc=
f1911:
>
>  =C2=A0 Linux 6.16-rc6 (2025-07-13 14:25:58 -0700)
>
> are available in the Git repository at:
>
>  =C2=A0 https://github.com/sophgo/linux.git tags/riscv-sophgo-dt-for-v=
6.17

You have based the branch on linux-6.16-rc6, but my own branch is
based on -rc3, so pulling this introduces a backmerge of hundreds
of upstream commits, which I would like to avoid.

Please rebase on top of -rc1 if possible.

> ----------------------------------------------------------------
> RISC-V Devicetrees for v6.17
>
> Sophgo:
>
> For CV18xx serials:
> - Add rtcsys device node.
> - Add reset device node.
> - Add ethernet device node.
> - Add support for Duo Module 01 Evaluation Board.
>  =C2=A0 This board uses SG2000(old codename CV181xH),
>  =C2=A0 which is dual-arch, RISC-V and ARM64. This
>  =C2=A0 patch add the support for ARM64.
> - Enable ethernet device for Huashan Pi.
> - Remove warning for mdio node.

For the commit log, I don't like lists that simply repeat
the one-line messages from the shortlog. You can leave this
part for now if it takes too long to rewrite, but next time
try to write full sentences describing the contents overall
as you did with the Duo Module, but don't list each
added device node separately.

> ----------------------------------------------------------------
> Alexander Sverdlin (7):
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 riscv: dts: sophgo: cv18xx: Add RTCSYS=
 device node
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dt-bindings: soc: sophgo: Move SoCs/bo=
ards from riscv into soc,=20
> add SG2000
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arm64: dts: sophgo: Add initial SG2000=
 SoC device tree
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arm64: dts: sophgo: Add Duo Module 01
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arm64: dts: sophgo: Add Duo Module 01 =
Evaluation Board
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arm64: Add SOPHGO SOC family Kconfig s=
upport
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arm64: defconfig: Enable rudimentary S=
ophgo SG2000 support

It's ok to mix riscv and arm64 commits in one branch, but the SG2000
series from Alexander should really be a separate branch. The way
I organize the soc tree, I have one branch for dts (and binding)
changes on existing SoCs, but separate branches for defconfig changes,
drivers/{soc,firmware,reset,...} etc.

Since the arm64 contents touch both Kconfig and defconfig files,
I would like to see them in one branch that combines the sg2000
dts/defconfig/Kconfig changes and their prerequisites, so I
can add that to my special "newsoc" branch that contains similar
commits for the newly added pxa1908, cix-p1 and andes-qilai SoCs.

      Arnd
