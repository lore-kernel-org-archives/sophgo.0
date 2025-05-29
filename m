Received: from mail-4323.protonmail.ch (mail-4323.protonmail.ch [185.70.43.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E1A155335
	for <sophgo@lists.linux.dev>; Thu, 29 May 2025 12:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748522211; cv=none; b=EE28nEOk18s08YPdEebMLXmjX4GL6sjjaUufi/IiIKljbXkGE/s5hVhJDvAHXkwx2r0fIHkfGLYHTQJgxzRFH7+wNoR1RZ4bC6TTwctffDIK2akXjEwdqgjM/2a0prUDNKgiVieCPaJCeMP6Nxg5+y9E8oyQPT8sSuGsm/GoWlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748522211; c=relaxed/simple;
	bh=w2ybtSVtY21iBAn6fIUrCy+v3R7crNBTB7q1bdIX8yo=;
	h=Date:To:From:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QCR4qYLFoKuGhfgsHTG1P8xY83XmODkkaCWmqge12tmaihabrjY1y7E6hWD2j5TO84tgP1wGH7PdmRVEveWE9ZlHnzOFu4pQaorgd9WzXOnwVi1ZfiDvTR7bhmtfeU1SFLgbs+PfaDnjdm/r/fRGpewGf4L3uvciRgDpZqjSjTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bamelis.dev; spf=pass smtp.mailfrom=bamelis.dev; dkim=pass (2048-bit key) header.d=bamelis.dev header.i=@bamelis.dev header.b=jbFIJkgQ; arc=none smtp.client-ip=185.70.43.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bamelis.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bamelis.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bamelis.dev header.i=@bamelis.dev header.b="jbFIJkgQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bamelis.dev;
	s=protonmail2; t=1748522207; x=1748781407;
	bh=w2ybtSVtY21iBAn6fIUrCy+v3R7crNBTB7q1bdIX8yo=;
	h=Date:To:From:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=jbFIJkgQQfRvEocgiAutpgd5J72LnnhNrQ9k6uLkgs+9ZWIoRqs8yLRcKBxiZmbVj
	 EiO9jDXyrd2VWxgxPLmIGuzrFejYtqymclehC9TmQtsT7zxo0o4Z6EMvaJZhZDLjB0
	 aIUmnsFXjVg3kgjFN3GmrZ4p46s8NODbyO4PZVErx0jLky0cOxo4U7K1tVrAXgciWm
	 sW6WjgbK69F6GTaC0mRmz1cpQ+fglj7zQPp9QBaITBO5XASnKCI/DuXRF/J8bjbdJG
	 fUlLVgwoyRiO34+YSNiVTFP/shL+wPiOJojPa1TOiH2i7I5q5zy5uvjOeZUnaFEJTl
	 fEsVkkvhYGVbg==
Date: Thu, 29 May 2025 12:36:42 +0000
To: Chen Wang <unicorn_wang@outlook.com>, "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>
From: Thomas Bamelis <thomas@bamelis.dev>
Subject: Re: Taking over Milk V Duo S dts development
Message-ID: <7391c52607767badb331bbd2a515272436de9755.camel@bamelis.dev>
In-Reply-To: <MA0P287MB2262607010D2B13CF862EDBDFE66A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
References: <3rBV0kNeG31FR7sMbqhrPU6Pt01dDnlBPZN_ihjbrqMSrP-wZXpuRJ1glIhWGdghF9OX5X6HNJ-D7X3_LQ4vZuAdL01n5ZHShWOx7wEt93Y=@bamelis.org> <MA0P287MB2262607010D2B13CF862EDBDFE66A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Feedback-ID: 67636720:user:proton
X-Pm-Message-ID: b8c1be868baa67371f8f8821bae08b561d99021f
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, 2025-05-29 at 20:28 +0800, Chen Wang wrote:
>=20
> On 2025/5/29 17:13, Thomas Bamelis wrote:
> > Hi all,
> >=20
> > As seen in the email chain between me, Thomas Petazzoni,=C2=A0Thomas
> > Bonnefille, Chen, and Inoch, it was okay for me to take over the
> > Milk-V Duo S dts development.
> > I have been working myself in by getting comfortable with the fsbl,
> > opensbi, u-boot, and previous work on the matter.
> > I'm comfortable configuring each of them and building them from
> > source to make my own fip.bin as to get comfortable with the boot
> > process.
> >=20
> > Since I invested quite some time (>20 hours) and am moving on to
> > the actual Linux dts, would it be possible to mention that I am
> > working on that in the Wiki?
> > Chances are slim, but I wouldn't like to put in all the work and
> > have somebody suddenly submit a patch before I could.
> >=20
> > As a side note, I noticed that the DDR size is set to 256MiB for
> > the SG2002, which implies no RTOS is running on the system.
> > As such, I will continue along the same line and assume no RTOS is
> > running for the SG2000, unless instructed otherwise.
>=20
> Thank you Thomas, welcome to contribue to upstream work.
>=20
> It should be noted that Inochi is currently reorganizing the dts of
> cv18xx (see the dts rework work description on the wiki for details),
> and it is expected to be merged in 6.16, so please develop based on
> the
> latest version.
>=20

I am developing on that latest version and following a similar layout
Inochi used for the SG2002 rework (but for the SG2000 in my case).
Thank you for the heads-up.

