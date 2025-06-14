Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA741F5838
	for <sophgo@lists.linux.dev>; Sat, 14 Jun 2025 21:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749934900; cv=none; b=HnnLMPHgN7zJTi+iEJy9+qpvjdaaS1lNhzc5VtiKk80wQqivbM3uphXoT5iBQdVmIrq6KUcP1qk/eIsAQ64nWLvyUeNAuvhcAs6SIT7W4m+U+lM9Bo7/fPTDAyS0pN0BwBSHani0A93IfkcF4gMuHK9khwOAmlsy70cwFwn7UlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749934900; c=relaxed/simple;
	bh=Oy6CdK35L5UqrWcqJg7mXl77gwCRN1At28m/lVEVQkk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IDlDIw4rDt319RsEKenctBq7hx+UznKjMjBOTf/EJWph6X5EqVsIgrI6+cn4SzrJIoCZACc1Udd1t4M/kdsT+YDp93UD9QR5fJOO7hUI9H1T1P5Qp+c/oNPK/STampcgBVEiYQLF7hQoSGHej0hcdlilwBvcq2I0fulAyqKS8Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fp2mSpAT; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fp2mSpAT"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-441ab63a415so35997035e9.3
        for <sophgo@lists.linux.dev>; Sat, 14 Jun 2025 14:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749934895; x=1750539695; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fxIEE+c6pUB0N6FNYktz5IvAb1U4IAe4R41rT8THtZE=;
        b=Fp2mSpATn0RRbrTW0P4A1WQE7D+weQ98zLNwYJzslnjBFNXttgEyavsgkzPT97qivJ
         O74JR0s5qHlma5cyEcIURQkHMqcURTRqLH5Rb3l7BuX7UG9lXlHxgP1dQokbL7sZEVVZ
         +JmFEQBFHI5oH5UWyohoeOr0LtcNlofiPPQCxQBtVoLCcOImMxjpZl3wMEc3oCBRQ8/y
         DpISA5RrI3uqYo6bGnHjgYuv0eJRk8Io/DMQbEVZ8/YU6vCendp86HaIqFn8GTc+9n9h
         Gizq3kErwjxqKe0cRIinvd+U3RB8vaq7ercmokLjYUTHEsIfUaibEZzN/kNhRmtY1a+B
         gzwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749934895; x=1750539695;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fxIEE+c6pUB0N6FNYktz5IvAb1U4IAe4R41rT8THtZE=;
        b=rZCkN/2HdPak3aWqStbYZJEfkpjnii5aTuea+lg9/hmbGKS4naEMB5yUR3bhUPbIZw
         1+GTrWBjSBP8AqpjE0HaFWc3NI8s1SBjCSrQ2df8p8i7mnMRN0JH5Cq+MUxMuC4rfFot
         9jZPDUyR2xQePvTD/tjOmTU4JKibWBN54KKgdACyn+N3YBpojU5a3am4mVvdFITtY+/2
         ZIoLeHTDxkjPvHS9VHwFe2f+R/Gy+RtVDs2XxQKZw+nM6Mod0NGoJuHuRsTttyEGZPRT
         bo3i9b/TljGGj/DOu9w1GVPVkABbOXBhBoWttmM1rwm/xvc9Aah98ESQmuN6LxsPq040
         Macw==
X-Forwarded-Encrypted: i=1; AJvYcCX4SLOuN24cH0z/iUOtNmJNlqTTC1vtEIUQ1EhdqKiUJKdKVfbgKOyCLP3P1HP6/unjbo/NmCI=@lists.linux.dev
X-Gm-Message-State: AOJu0YzlaGcH9aXIcMDrsMW/k3b5EzE2X4yKLQTSb0+CWpb+k8GvvyKq
	2OzMuOI/s4+2919I0HfoDvHjRtCTSa/04hrksgBJ+1gmYsKtf1j1UdQM
X-Gm-Gg: ASbGnctqhmr+FzdLByNw/d36AbXUaovy/xu64HHFq6OtWMeEt9RO92F/hGSullVxGLa
	ffyxFwMXKK8zMYMvKCxWoYnmcHQ8b6xP5RgumVCLEtfYdsOVmhDrvZCzOhFBvpZMBB18ub77OQn
	zG/Z7ChIPupdqgcg8QMbdU7wmZDhulDFUfAjcV03cSUzLEpEadNq6pgBVjiNOviYWl/10zNIAXm
	ryKK9OeZyVn9WMQMBJzK8iyfR+NyzTBzyg5qY1bwE/HTAuLm4HY9iWXAcA5QRDhRszpUOv6IQAU
	aSdTHCi9RnBafgkdzQv2rNu+qJ0TbVmPbsngdn8rDXy5h9Ofq1agITz3HmZ99rOvzhJt/lScllv
	8AT8Flw==
X-Google-Smtp-Source: AGHT+IFczogrn/L57qlQe9UCB84Ov9Y9pOTc5rwLMmgD+dlRC+Fn7LKHG3fxgIt+gTTBlBv82V4M7w==
X-Received: by 2002:a05:600c:8b48:b0:442:e9eb:cba2 with SMTP id 5b1f17b1804b1-4533c9c107dmr43924655e9.0.1749934894673;
        Sat, 14 Jun 2025 14:01:34 -0700 (PDT)
Received: from giga-mm-7.home ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e224956sm92863175e9.4.2025.06.14.14.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 14:01:34 -0700 (PDT)
Message-ID: <7a4ceb2e0b75848c9400dc5a56007e6c46306cdc.camel@gmail.com>
Subject: Re: [PATCH net-next RFC 0/3] riscv: dts: sophgo: Add ethernet
 support for cv18xx
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>,  "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen
 Wang	 <unicorn_wang@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>,  Richard Cochran
 <richardcochran@gmail.com>, Yixun Lan <dlan@gentoo.org>, Thomas Bonnefille	
 <thomas.bonnefille@bootlin.com>, Ze Huang <huangze@whut.edu.cn>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 sophgo@lists.linux.dev, 	linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Longbin Li	 <looong.bin@gmail.com>
Date: Sat, 14 Jun 2025 23:01:43 +0200
In-Reply-To: <20250611080709.1182183-1-inochiama@gmail.com>
References: <20250611080709.1182183-1-inochiama@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Thanks for the series Inochi!

On Wed, 2025-06-11 at 16:07 +0800, Inochi Amaoto wrote:
> Add device binding and dts for CV18XX series SoC, this dts change series
> require both the mdio patch [1] and the reset patch [2].
>=20
> [1] https://lore.kernel.org/all/20250611080228.1166090-1-inochiama@gmail.=
com
> [2] https://lore.kernel.org/all/20250611075321.1160973-1-inochiama@gmail.=
com
>=20
> Inochi Amaoto (3):
> =C2=A0 dt-bindings: net: Add support for Sophgo CV1800 dwmac
> =C2=A0 riscv: dts: sophgo: Add ethernet device for cv18xx
> =C2=A0 riscv: dts: sophgo: Add mdio multiplexer device for cv18xx

Taking into account, whatever MII variation is implemented in the SoC
is always internal (and only MDIO part is multiplexed), can we add
	phy-mode =3D "internal";
and
	phy-handle =3D <&internal_ephy>;
right into cv180x.dtsi?

Boards can then enable the corresponding nodes if they wire RJ45 connector,
but I see no way how they could vary the MII connection.

>=20
> =C2=A0.../bindings/net/sophgo,cv1800b-dwmac.yaml=C2=A0=C2=A0=C2=A0 | 113 =
++++++++++++++++++
> =C2=A0arch/riscv/boot/dts/sophgo/cv180x.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 70 +++++++++++
> =C2=A02 files changed, 183 insertions(+)
> =C2=A0create mode 100644 Documentation/devicetree/bindings/net/sophgo,cv1=
800b-dwmac.yaml
>=20
>=20
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> prerequisite-patch-id: d5162144180458b11587ebd4ad24e5e3f62b0caf
> prerequisite-patch-id: 9e1992d2ec3c81fbcc463ff7397168fc2acbbf1b
> prerequisite-patch-id: ab3ca8c9cda888f429945fb0283145122975b734
> prerequisite-patch-id: bd94f8bd3d4ce4f3b153cbb36a3896c5dc143c17
> prerequisite-patch-id: 1b73196566058718471def62bc215d2f319513c3
> prerequisite-patch-id: 54157303203826ccf91e985458c4ae7bcdd9b2ba
> --
> 2.49.0

--=20
Alexander Sverdlin.
