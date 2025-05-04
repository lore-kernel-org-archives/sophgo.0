Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7B6156C6F
	for <sophgo@lists.linux.dev>; Sun,  4 May 2025 10:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746356141; cv=none; b=BSZevxaDC7CS+4/iP4WW/0tDvOsQVvLa/dt8TKGYO4tuJwpXSD455CnCrnsGh7HHOixoAofZf686wM5s5goiwibgyLG4i5U6hV2t47n9kbwgexyghRCVbNeAtk72gFTXpPyhVNIvEilZ/y1KYCGA+HXXmtmFizkg23kuSqe7oFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746356141; c=relaxed/simple;
	bh=JHticgXyIuVL8fJ2I1XWOAHd1k7KFWJZtBwgTOARLQE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=i/VNliOdEUvHRwREPNldcKdSnojuzp4wOIF4XAJ+7Kesf0EJMKszmPo7yzgc195w733yBLz8x4iQso9gBZcq1rMhaLO2UqOAA0hFqJjPme24URHY1SAfBrHvhLdyVJMGBNp6/4hjezkzo24RPb4a8IbcPf9L9GgaVMGZS+SYh0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cnALpWGD; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cnALpWGD"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ac339f53df9so735864466b.1
        for <sophgo@lists.linux.dev>; Sun, 04 May 2025 03:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746356138; x=1746960938; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JHticgXyIuVL8fJ2I1XWOAHd1k7KFWJZtBwgTOARLQE=;
        b=cnALpWGDIo2A7Wr7lFq8+6jiFrWoKR8oFNyCs2TdRCci71iRhoEEp+LUcN7NjElzn4
         ChR8sAfZ4T11bT2/0RcbK+40ti64fGaMdnzENbHuxlUJhVnvoTAzonmwL0zhPQ1W0LfA
         0clavI3gsDdQklfnnxCYz5MAdlJcHXDkNhNHL60ycZstykqCqEouUbuwnYK/xsVLTECk
         A7l2+MYd4os+WWL+gsJZDQqW+51vYm/rpysr4id1vvjppZvv1wyOI2dLHXsNhqnDDVXd
         IRFa63Ofv/iAmaH2Ze4wtYshjuFrVNilHvw3bqKUHYy/zX3R+MEW1I2TFKokJuZIsQUl
         ShGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746356138; x=1746960938;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JHticgXyIuVL8fJ2I1XWOAHd1k7KFWJZtBwgTOARLQE=;
        b=MGUSkS/2QH2EWRsEQE0EcNDaNwc9TIQI4biMTWV3/HXmvAelTqbxbm21lX7NGY/BaG
         pipoTFd+j9yxqYBK9arlAtFxneE0ItJy6jwnS8gY3b/hkjp6B41nAn9fAysgWXfaQx0D
         xvcIjpvAeFlM0/nYVwICbBQHh29jWAz5pS7BnV1wQUfCXoChTbLoME4/wIOFo9r9c+66
         8vPRD7CWLvdRvZF6XJHISGQpiISP4DWsfs1lTKLCLA1svkBG8Ez8rEIn1kUZEocKElGb
         cWEDYA5nm4DTsCsIsJ0igSm3Y1ujKtykGnN7eqBxZm3v23TVaMdFaD6xNOxoFbaMcgnn
         8iSw==
X-Forwarded-Encrypted: i=1; AJvYcCW6p9IrMtIeIDFYd+GexH8KloItKVg1LPmH0pzFoaBkCjGP7PoOTE0WedkGhJXiR7NQS8qcXB8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxMRQp/4yjE8IysiK79fP+wduwG40kb5CdhxNkvMmajHc4RtHAX
	x/QqSNecIa56rYhUW9oSJkNV+aSSi+EBr6MwjJ+pYtHzSvSCsj94
X-Gm-Gg: ASbGncs4htSrt1ElA4wzSMlOkFA34lQfEsAt+6gwXbwb0T3fXuwfQKHyo3GLIAYQyrG
	A2v5OjCbQuVt8fgKMUF0yB8Pj7xZTbP7DU9/p6f+ZYmiNTFsADjBcQVG9gPYMhsfL1KAsunn4zi
	OcjaogD/lAiXnMSAag7vAcjYR/cmnRhDOYKYpuZaRH63XHmCjC2T+xViiK/l4DpCxkZMvYP+NLo
	E1kbVwYjVK53TlSeLZzH0xcksnfLzQvMN4a0vlHhoy90ZL2dzRvSrW7Bt922e1gcOt1prSRnO4H
	FfXNKaXoa/JjUv3ppW2yQLoewmTJwlSlJkZlcDg43rSgyK4QANw4Mp+8YL+5C28X/AEwVnc=
X-Google-Smtp-Source: AGHT+IGPBRqZ8nAL71n+j3b7Cwv7/Y14UgPdPJpAj77aNr8QGSe9maFrY5B6bcLyEAGl4PoeZoym2g==
X-Received: by 2002:a17:907:980d:b0:ac7:d23d:b3ac with SMTP id a640c23a62f3a-ad1a4b3773amr291859166b.53.1746356137751;
        Sun, 04 May 2025 03:55:37 -0700 (PDT)
Received: from giga-mm-3.home ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad189147329sm313852266b.1.2025.05.04.03.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 03:55:37 -0700 (PDT)
Message-ID: <284f4158408d4047a52d427c9189910064b24d97.camel@gmail.com>
Subject: Re: [PATCH v2 3/3] riscv: dts: sophgo: switch precise compatible
 for existed clock device for CV18XX
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Date: Sun, 04 May 2025 12:55:41 +0200
In-Reply-To: <20250504104553.1447819-4-inochiama@gmail.com>
References: <20250504104553.1447819-1-inochiama@gmail.com>
	 <20250504104553.1447819-4-inochiama@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Sun, 2025-05-04 at 18:45 +0800, Inochi Amaoto wrote:
> replace newly added precise compatible with old one for existed
> clock device of CV18XX series SoCs.
>=20
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>

Reviewed-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

> ---
> =C2=A0arch/riscv/boot/dts/sophgo/cv1800b.dtsi | 2 +-
> =C2=A0arch/riscv/boot/dts/sophgo/cv1812h.dtsi | 2 +-
> =C2=A0arch/riscv/boot/dts/sophgo/sg2002.dtsi=C2=A0 | 2 +-
> =C2=A03 files changed, 3 insertions(+), 3 deletions(-)

--=20
Alexander Sverdlin.
