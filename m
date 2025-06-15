Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74DF927BF95
	for <sophgo@lists.linux.dev>; Sun, 15 Jun 2025 15:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750001942; cv=none; b=fM4x3ucZN8ZQMJl8QvaACEGycWAyloSQn5GIjj7Dg70DgPf9H1jgxQPemkbjNLMbajNHxcsS55y+lxya8G1hdB9WC9G2rVSK/qUcFRdKNgdXNom+gidlHISjEZviGv8IDFUpoGTr2JH639Hw9WYwq1lp3Voc4huB4VUCas7ojsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750001942; c=relaxed/simple;
	bh=rME222jHVNJXTiRKF33r0lWMTw33bee8wdcsXHC+a1s=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HCgwJmknyzs4xaUJty23mcjo5lkaR6sPpxhbl+ktOjiZOJqB9v9xVyGck4KiALq0KHvJNXc3sFzhq8v3uVQPrPG4M2WVEJbrR9a+/33rCeHdn8Fsgw4GeEv5qJ4LjADHW8ODGKt3NnTcDSx/tuTsT7UIbIdZEjmpiZ6RM+e4djo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HaTGYUL+; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HaTGYUL+"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-450cfb79177so22136605e9.0
        for <sophgo@lists.linux.dev>; Sun, 15 Jun 2025 08:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750001939; x=1750606739; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rME222jHVNJXTiRKF33r0lWMTw33bee8wdcsXHC+a1s=;
        b=HaTGYUL+SZ5h6Y3gOxrEpXL7rTBr2vFks3cPN/86Ptl1pNfcOFSYjBt5Fb1Bs1eTjI
         BbJ35JvCPd5K3qKgxKd5fRZRFUOzKV8MHXTNfRnXdBAMcdcPAQMNsWUbUTEuat3DWbxI
         LUr/cbC19vQzY1LjJEoCc36Qzb9tegv7OO9fVn5CurY8RTtqPtXkLdiIZ3p7Z8V1Ii1H
         MP9rkJ9f0whH+ImqMVRlmO4lTvBC8saQKFrJhlbO/iv5dtutZQsLKxBJHkqPY00ZGn4m
         94LS9UGZoIYZfGrzIdYlKk2lJdz+bxGxyxn9BQAo0btCvyAeKHE+a2GePRX42iHwAmlH
         Uchw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750001939; x=1750606739;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rME222jHVNJXTiRKF33r0lWMTw33bee8wdcsXHC+a1s=;
        b=qgHv4r5F/3u4hSCCFhjaxopr4Tze6GX+M0AK05ROpr6LpOV2q03ctJ+wo8ewT2X0g7
         pqz50fmFftd2WJLVM439D1YWCnfODFeuQGt5HOlqzgEPmAlmLJz4hUP92aU9t6Q/jLM1
         IDOhaouvSdhdjRItBS08PsyU3meti2PFP+KStF+dsfzd5RL+pViaI55rWCRQTtls9JrE
         l9kS0D5rBn5/CJwgwD8XPT/fIDEs260jQm/y1qlHeVEF6mYJbWMWBz5MdYa/IbDhFci7
         3BG9Ydet/mBds64wLo6/8XAQWPsOdumYWbWkdnn8aN8n+yiSIG1p4iME3X/SMVhtxjCW
         G6Iw==
X-Forwarded-Encrypted: i=1; AJvYcCXWrkoJ76YRzrVMMy1oR+aBByc/QzT8ex1D3N2nksKXjIa1mp2I+n6nexBbM2mLkf9X3undkKQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxwxyVaEkBRQHEX6wpU1QDTfRt0U7GR7ev2lhxsbMBvfcG7TlA8
	scakW1YsJvmhWKcOdibKocpiXhaDcbeWQpuH+Ro+iE8n3CmPJ53VJiL7
X-Gm-Gg: ASbGnctySIUfxX2wLvnmAWN/9eV29uIlg1XIGKlnf8TFRTHcm5FGswgLw7hfCybIMYU
	abQOSn9NuDuskm+yEswUcx1g7WNXniEYZMufgcJFwon/ppqE1JBEApgNgvNPR4uuFz2IzY9lUSw
	1QCt0rKPh/Jdup34KHSqPbB44+w9jkFVgl8nbU9+h99pM0CasjUqgavn90LI8c4yFwtPOwDbW1L
	oh2ud+HG46jgJnYYKXcdtQOmo+LRJRoNbRwSxPTq30wYOg//kllo4xpdbNh1D7Qu4x1KgVLffyW
	5CkqHU/4KizV8ovYFx390f0tXqQmE++1TSUN2R0uktEss0mr7dG8edEQsz7L9K0LGWD6leDJTIl
	QWKD36rC+KFvWS/OM
X-Google-Smtp-Source: AGHT+IFaaughF501wrIicIPdZSmtM/WV0+01/gyRTwtKr7hDVNcSWz3eVWkWINX+wq9hJITrW3t+2g==
X-Received: by 2002:a05:6000:2883:b0:3a4:d3ff:cef2 with SMTP id ffacd0b85a97d-3a572e82213mr5614719f8f.27.1750001938625;
        Sun, 15 Jun 2025 08:38:58 -0700 (PDT)
Received: from giga-mm-7.home ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a5405asm8229858f8f.13.2025.06.15.08.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 08:38:58 -0700 (PDT)
Message-ID: <3b9237628547fdaa65f524204b79176e5461cc71.camel@gmail.com>
Subject: Re: [PATCH v4 2/2] phy: sophgo: Add USB 2.0 PHY driver for Sophgo
 CV18XX/SG200X
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I	 <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen Wang	 <unicorn_wang@outlook.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, Longbin Li
	 <looong.bin@gmail.com>
Date: Sun, 15 Jun 2025 17:39:10 +0200
In-Reply-To: <20250611081804.1196397-3-inochiama@gmail.com>
References: <20250611081804.1196397-1-inochiama@gmail.com>
	 <20250611081804.1196397-3-inochiama@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Thanks for the patch, Inochi!

On Wed, 2025-06-11 at 16:18 +0800, Inochi Amaoto wrote:
> Add USB 2.0 PHY driver for Sophgo CV18XX/SG200X. Currently
> this driver does not support OTG mode as lack of document.
>=20
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>

Successfully tested in host mode on Milk-V Duo Module 01 EVB:

Tested-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

> ---
> =C2=A0drivers/phy/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> =C2=A0drivers/phy/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> =C2=A0drivers/phy/sophgo/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 19 +++
> =C2=A0drivers/phy/sophgo/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +
> =C2=A0drivers/phy/sophgo/phy-cv1800-usb2.c | 222 ++++++++++++++++++++++++=
+++
> =C2=A05 files changed, 245 insertions(+)
> =C2=A0create mode 100644 drivers/phy/sophgo/Kconfig
> =C2=A0create mode 100644 drivers/phy/sophgo/Makefile
> =C2=A0create mode 100644 drivers/phy/sophgo/phy-cv1800-usb2.c

--=20
Alexander Sverdlin.
