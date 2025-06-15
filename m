Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04BF27BF99
	for <sophgo@lists.linux.dev>; Sun, 15 Jun 2025 15:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750001947; cv=none; b=nsTsE5s68bq3LzpeOQ7j9EXFlzuLdYiamPbUSo31IdJ+jSmt+uA8+BN01UgR21kLSFejYlyYkbaXPz+Ppjv8v6iTfytdpOPQOg/lYx0dY8aaKb6vQkiaITY/AQnHKMRZVUjqYhDf2SFgUDm8+K9ZqyEUyJjpE8PMxyprCDzkZbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750001947; c=relaxed/simple;
	bh=wcbVuvRtZ3mAuFzXuF9+M9EX2ls9QRm4Zi5LwXhPPgs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oQ2i/YNLUeUVUGJMYgUCcJctnl2/Iwvw0ZdwaGzU4+pbbvjVZBCxsgyDs8GvdDNqJT+dp5jbGzEfeG0RE4YEF7gWy1OwjOVhshsSoV0QnV74QWSR2VPS5S3KuOkQEbKevEKwwLX56Ylts7HTITbmDvBwAyqnD17ELwAyqRjg93I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gKLBFd38; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gKLBFd38"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a36748920cso4233823f8f.2
        for <sophgo@lists.linux.dev>; Sun, 15 Jun 2025 08:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750001944; x=1750606744; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wcbVuvRtZ3mAuFzXuF9+M9EX2ls9QRm4Zi5LwXhPPgs=;
        b=gKLBFd38RwQbBmdoZljpF4b6lxqyaPbd7R8aOCb2NQkaSXrh1cyqSowcnyDRMAMxVx
         N3qhXNgMSVQbPrJZmUyJb+8cebHQvvB+yX/hzP3MHuT3VHjIFSm4f8MY8py3n9E1OIU8
         bBuJe0sgXSDLXcqTlXKQClhgu6T794BXS/NiePHaRca639Ghsp+l0s0qj1n5OAuTsQ2A
         QfLtCM5slOXR4gme5mfYm4U+pwlT6FLoJ2XibqIGKJfcIoGnqJbXye7MIoqFEgcC8/aH
         cwVtuJ85sVY+MwT3qLXDExcooCGw0Glil8qQoJSS2MdsZSmgDSDPg6KVmf6OuGPbKybF
         MFOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750001944; x=1750606744;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wcbVuvRtZ3mAuFzXuF9+M9EX2ls9QRm4Zi5LwXhPPgs=;
        b=Gvo6zha2llgsBb6ymekqf89pqBzudv3IhEkTE5E/2bk/C+2CDlw6l9OK6sL9vxUVzG
         qviNRd5hyE+D/rqUvEbefp+5xxH8yF10vDjD9egHA064DyXTT85NHc4xq/P6fU+O9B3N
         QzLNwcwHzcU2nuWgsSPDUyyowIqU4m5EOhK/QV51YCv0oAAvMRV0x4iY8D7PzHeQpUgV
         /xGX3KuaKspWqCT5GpS0ocB1Sje4L3xMSLD2CTVJ3sVff5c8ib6IUAhCFc7RQgtrHgDD
         z4vy/wdIKXdoooaqAORZV/uowSYKBgOBCUt2ZqsYRs5OgB8o/nSl8q+fGTQ2ZnELGHBG
         GK4w==
X-Forwarded-Encrypted: i=1; AJvYcCVtZJQ64SDjmvYFdu6pifnSpQjE1FMm2EOzV3JIAAAYYPjj765BjZqMtXQVKMOObHVsluZ1B14=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8VbasuPIlu5epftzG9WWpzs6H5lRB6p94XWet/8HC8GVGSW8z
	vpY2G2WDwZbBuy7/XbTW9VoyIHiHz3DYARuWcNhyX4aUEfoSJXCMXOqI
X-Gm-Gg: ASbGncsG0RFy3WWf+213gPEQLC/LYS2IFpWqMwwwXtCC88JWYYqEfSXuMkGUyfhKJ0U
	7LgWdMm4e627w8HLs5Ren1PXXuy6/9mWXWcJndJVAcKtIRQtpiJBIgN64Et4gJuJc0xhC/GErRa
	PSE8or7tIxFe+EF40pQg5DAcS05xDTA6DovkYlms3JSnBD3hF91zwc4KXO6KepYjNOin2zE9jjO
	oWnXvqraXqXHZhjohzYNQyHmUcGFSs2Na1t0rPxcH4n6RQ6Xe/3B7RHaWdJ1wF2+/JK9TEdAWIG
	biW/vQLay8YvwfZXTLiJVH398D69nDSgj43Y05FqeCaeFZKnPXvhUiGEvvtwC4ewCUUWH0zDqnf
	9rC4F5w==
X-Google-Smtp-Source: AGHT+IHTCj/8xJaYk/rbIb+RSYTHCr6hOLzVXx4YVk5M42GtMekvX58mlmih49xOLygZ2eRiQqolng==
X-Received: by 2002:a05:6000:2408:b0:3a5:2f23:377d with SMTP id ffacd0b85a97d-3a572e4c71emr4704384f8f.50.1750001943816;
        Sun, 15 Jun 2025 08:39:03 -0700 (PDT)
Received: from giga-mm-7.home ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4534394c90fsm34711485e9.3.2025.06.15.08.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 08:39:03 -0700 (PDT)
Message-ID: <ebdba4671998c23e6b0eebee77bf2b3cd439341a.camel@gmail.com>
Subject: Re: [PATCH v3 3/4] riscv: dts: sophgo: add reset generator for
 Sophgo CV1800 series SoC
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>, Philipp Zabel
 <p.zabel@pengutronix.de>,  Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,  Chen
 Wang <unicorn_wang@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt	 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti	 <alex@ghiti.fr>, Vinod Koul <vkoul@kernel.org>, Yu Yuan
 <yu.yuan@sjtu.edu.cn>,  Ze Huang <huangze@whut.edu.cn>, Thomas Bonnefille
 <thomas.bonnefille@bootlin.com>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, dmaengine@vger.kernel.org, Yixun Lan
	 <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Date: Sun, 15 Jun 2025 17:39:15 +0200
In-Reply-To: <20250611075321.1160973-4-inochiama@gmail.com>
References: <20250611075321.1160973-1-inochiama@gmail.com>
	 <20250611075321.1160973-4-inochiama@gmail.com>
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

On Wed, 2025-06-11 at 15:53 +0800, Inochi Amaoto wrote:
> Add reset generator node for all CV18XX series SoC.
>=20
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> Reviewed-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

Successfully tested with USB series in host mode on Milk-V Duo Module 01 EV=
B:

Tested-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

> ---
> =C2=A0arch/riscv/boot/dts/sophgo/cv180x.dtsi=C2=A0=C2=A0=C2=A0 |=C2=A0 7 =
++
> =C2=A0arch/riscv/boot/dts/sophgo/cv18xx-reset.h | 98 ++++++++++++++++++++=
+++
> =C2=A02 files changed, 105 insertions(+)
> =C2=A0create mode 100644 arch/riscv/boot/dts/sophgo/cv18xx-reset.h

--=20
Alexander Sverdlin.
