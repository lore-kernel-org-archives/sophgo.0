Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com [188.165.51.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F21821B9E1
	for <sophgo@lists.linux.dev>; Thu, 29 May 2025 09:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.165.51.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748510033; cv=none; b=jZV/HOad+b0HWw1r0JlM69/a6RfURlz/k4OMYyz5BLOHjWk6sEnKcJ3XWfUk3c/eapVBtXPOuZHt0+amI74ek8vfR2wfxkaEnY4BlvhooJRl49Vg2QGVPpxx6DlW8vyDYCgJ8IjFVon9zn2NrFbH234puvzQa+PqLkyQSCWZfWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748510033; c=relaxed/simple;
	bh=nGbgzFPQdBs1Y3k6U/V7eolhDLUA5uw7PmsjARWRyrs=;
	h=Date:To:From:Subject:Message-ID:MIME-Version:Content-Type; b=qw9qWa1Wx5svMO/bbMDRONEDiimOXqk2GURLKEiFat2kbqpJRt5PO5GsjMtrm3b2eV24Xxz8dm4TEFGaCafFy7wlTneGM2wowLHgjS49MsXKtrcYNDEPAfMHeF2HmBvYQlxJQbqz4T8FWC3wdMETBGc4c6bN0AYYSJOsX6UOohU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bamelis.org; spf=pass smtp.mailfrom=bamelis.org; dkim=pass (2048-bit key) header.d=bamelis.org header.i=@bamelis.org header.b=DNaiPKio; arc=none smtp.client-ip=188.165.51.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bamelis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bamelis.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bamelis.org header.i=@bamelis.org header.b="DNaiPKio"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bamelis.org;
	s=protonmail2; t=1748510019; x=1748769219;
	bh=nGbgzFPQdBs1Y3k6U/V7eolhDLUA5uw7PmsjARWRyrs=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=DNaiPKioY5NT+lE1QpfQOXI++NDiSsPJMs5Fj/Dfb8HLzO+Q0sK5Yi7DVrM2FGhsP
	 SqBiOLeZBe7VNg5ISAqBa0UOt1/RPzVpbBHn2sftyE5btf46XkGirpVKaUzLIbQlld
	 quGYWtvpfZlPbKxQ/Eu1qfb1AHnq7CbK2qDx0/FzJteHZs0kO6SZUtOGfLHY+MbnLS
	 B9Icot43tLf4ovLwAjLT4IepODRjEEaFyiTWCD3RKaCc4o63OcjhAu4/iARKhMADeL
	 G2pz6L7/lfSdeMIeTw+fzTBNBTX2jjy+HcY5LyYB3rWDtGi7E61jGWSXbLqEY4Do7L
	 iLxqR7GU/b5Wg==
Date: Thu, 29 May 2025 09:13:35 +0000
To: "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>
From: Thomas Bamelis <thomas@bamelis.org>
Subject: Taking over Milk V Duo S dts development
Message-ID: <3rBV0kNeG31FR7sMbqhrPU6Pt01dDnlBPZN_ihjbrqMSrP-wZXpuRJ1glIhWGdghF9OX5X6HNJ-D7X3_LQ4vZuAdL01n5ZHShWOx7wEt93Y=@bamelis.org>
Feedback-ID: 8542570:user:proton
X-Pm-Message-ID: 3e79569b6eaefcc49b623255ea78230e314069b6
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi all,

As seen in the email chain between me, Thomas Petazzoni,=C2=A0Thomas Bonnef=
ille, Chen, and Inoch, it was okay for me to take over the Milk-V Duo S dts=
 development.
I have been working myself in by getting comfortable with the fsbl, opensbi=
, u-boot, and previous work on the matter.
I'm comfortable configuring each of them and building them from source to m=
ake my own fip.bin as to get comfortable with the boot process.

Since I invested quite some time (>20 hours) and am moving on to the actual=
 Linux dts, would it be possible to mention that I am working on that in th=
e Wiki?
Chances are slim, but I wouldn't like to put in all the work and have someb=
ody suddenly submit a patch before I could.

As a side note, I noticed that the DDR size is set to 256MiB for the SG2002=
, which implies no RTOS is running on the system.
As such, I will continue along the same line and assume no RTOS is running =
for the SG2000, unless instructed otherwise.

Best regards,
Thomas Bamelis
