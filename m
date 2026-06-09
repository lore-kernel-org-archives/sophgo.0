Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78BE8413602
	for <sophgo@lists.linux.dev>; Tue,  9 Jun 2026 12:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781007367; cv=none; b=awJ6wwai+f0gVJ1lgBXMO/JgClnTiBggmNk0PhKAcuhbkGyR8f10t7otucmf/4g1EUdSb/UivojhHEdz/76oFPlDL/Vow/PxSvq+70Cs8bVJUFypIosuve7HQ85JzL25jAwoXIpTtQo8uHEZfpG92uEmS74N8opDdkdps31R9j4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781007367; c=relaxed/simple;
	bh=XkloCPiWg4P7BbKfmWmzw0cLyp62VYh02fktyXEwlgY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZOQjISkRnxj9pDj8cm+4EraSgxo35Ejdq+ugyDVAt0D6dAlLrYnuuT0zJhTrsffYIrERnG1uZj7RFA5p7RWx8npMqPGx+mQvHnBa3JONynbquj8I3bm22cfiBzl3M1WGuWjBOXSmUgiL1Wmm4TACl3Op7T1aII2m5YZXEScPQDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZceFMwHu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZceFMwHu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14E501F00898;
	Tue,  9 Jun 2026 12:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781007366;
	bh=XkloCPiWg4P7BbKfmWmzw0cLyp62VYh02fktyXEwlgY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZceFMwHuhjMoxPVfsH8i3RA9WME9jhvz50z/QSvrasjf1snaRWcu3SX3UQF2Dj8Cj
	 zblpjWr4SzkcKuVgsj+O76I/HxGr9BJJlZ+98Yqog5W3CdG+f1ClNzm1vUq41l7mDV
	 n6d5aj+L7+Fyrh7QmQaJYQvfwvHecgS83ahpHNx3sHHGuTLsrUFjNF5k9uJpunT4yQ
	 61tyaVplz0K3uMKd92YaOVbBCP1uyl0ZOQRnF1kXy1iUaCYdTjWyduwTG0uP5VYOXC
	 H6SJMMVUAZrZONo3ZCc3EMuOzp/cOs724V1qPC4wLVqJqk//qTArmDEqXa2hTEkD/5
	 72CNQ8gKD4MFw==
Date: Tue, 9 Jun 2026 14:16:02 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chen Wang <unicorn_wang@outlook.com>
Cc: soc@kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	Conor Dooley <conor+dt@kernel.org>, Inochi Amaoto <inochiama@gmail.com>, 
	"sophgo@lists.linux.dev" <sophgo@lists.linux.dev>, linux-riscv <linux-riscv@lists.infradead.org>, 
	Han Gao <gaohan@iscas.ac.cn>, Chen Wang <chen.wang@linux.dev>, 
	Icenowy Zheng <zhengxingda@iscas.ac.cn>, Joshua Milas <josh.milas@gmail.com>
Subject: Re: [GIT PULL] RISC-V Sophgo Devicetrees for v7.2
Message-ID: <20260609-free-bloodhound-of-election-d83fe3@quoll>
References: <MA5PR01MB1250024541E71412DDA04B4AAFE132@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <MA5PR01MB1250024541E71412DDA04B4AAFE132@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>

On Wed, Jun 03, 2026 at 02:17:42PM +0800, Chen Wang wrote:
> Hey Arnd,
>=20
> Please pull this dt changes for RISC-V/Sophgo.
>=20
> BTW: Next PR, I will start using my new work email address:
> chen.wang@linux.dev.

Thanks, appreciated.

>=20
> Thanks,
>=20
> Chen
>=20
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e7=
31:
>=20
> =C2=A0 Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
>=20
> are available in the Git repository at:
>=20
> =C2=A0 https://github.com/sophgo/linux.git tags/riscv-sophgo-dt-for-v7.2
>=20
> for you to fetch changes up to 903a9364e40563faf4730dc63ad7446246f494ff:
>=20
> =C2=A0 riscv: dts: sophgo: reduce SG2042 MSI count to 16 (2026-06-03 10:0=
9:38
> +0800)
>=20
> ----------------------------------------------------------------
> RISC-V Devicetrees for v7.2

Thanks, applied

Best regards,
Krzysztof

