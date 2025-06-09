Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A2D1F4717
	for <sophgo@lists.linux.dev>; Mon,  9 Jun 2025 16:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749487279; cv=none; b=MbI/MX/kgxmgtoBhXHPFbA0ChtcVuLzIVA9TUe6xrzzDTz2d1dc7rKDh0teJ4YUcwyIfDKNYf34eEPI8J2Rwxrz2fuLSH4WsAbhKEmQspe4Bvb/+AHiYhArMZzI65EwvhhAxKEoLea2MD4LEkTp71dGWnBYOKxeNprI0kQ5HJ00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749487279; c=relaxed/simple;
	bh=SS1ghkgByas5aSVYoAcXnpxd4fVUVMPVtRUUyrprOiI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=P1luQJGtUtNgQIanbZQg6ByTkBqeT/HAvnZPSQR5eGG97XgKFHHW+yj7Rocz2J8c5nR/E6ERhhcVppcb+WogpBG03S0WmXOJfg3LqDLzKey/bBvdnTumZ84mMkfw2aDELCfgujDJ4yZDwSUqLjZZj38iztx9g4Hz8mMYW8FxSx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Is/CgsrZ; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Is/CgsrZ"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a5123c1533so2507227f8f.2
        for <sophgo@lists.linux.dev>; Mon, 09 Jun 2025 09:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749487276; x=1750092076; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SS1ghkgByas5aSVYoAcXnpxd4fVUVMPVtRUUyrprOiI=;
        b=Is/CgsrZsPkSgGM4BBnTOrQbMbLuRNqq+ot86YNwFNmJU5SB40dwJuERdWf7iVOiaH
         Vk+WdUQUpCS41qsCHaOAqwGMXi9on1kngCCOIx9pKPewx+sHSQjU/08D9WUs0H8p9kO8
         csns1kpLBc2QzL+rMmB+DZPDM9Bp+IMguRdnh/nqUGW75rhzjiW3VVbN/QT85PaBzqMM
         5bAwkTGDXVOfIM+Ju3TceA+H6gBVzci32/dlvjLuRl04+HVoNx9CMT/BnLR4MAARs6ps
         Uah3nZK8kyKhGS4jnCZmWnLfCLSRnXMh83y537I2UfPhx/CmS0kI+S00y0q+fwyUTlFR
         XcOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749487276; x=1750092076;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SS1ghkgByas5aSVYoAcXnpxd4fVUVMPVtRUUyrprOiI=;
        b=tfGb3BMYru4rMsLIBzazDzNUEybiRyr2ULdKORRpmtCO03A7LeklnnqawJWv3NLLPZ
         MPeeIAoNPhWRmkRq1w+J8yVX0lGcMC0etuGkqR9Mj05omSZJinv+WGsuspLewfQHPDCq
         qiautCKleUM9JsASPzToc40e9Ogp9SQ7iNaXw3JUxTOg/8yPNE+c9AMws2rMbo7BY5bm
         sK+j8imK97Jh7CazW4xGA6tjdul0rzmSyEr+U7K+6s/P33KG1ZsxX5WgKakrSgiYDEO2
         8JZv7D2lwME0ozVSTHVj6wn0QvRsap7OSphmkRzoTHcgUmMjs5eZCLpxag6xVAvm4N7Q
         U/XA==
X-Forwarded-Encrypted: i=1; AJvYcCUZuIRLXN9SNMTWoz+HNQvfBZ54iF+OMOl7ZGUt910qfsrP4hja6jjBfh7T3zB2ko8rZItLXW8=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywg3DZpSXUW4bsj5cezGFZEVxPVsr5a96BbWNBKrCETcknuQo/q
	ScMMWQxBgLZ+l4iEuNVcQ7LTMejhHSZE8hSa34b+ilR2NAoiRXcQCF1S
X-Gm-Gg: ASbGncvarEyh6z9+p5yaV/PbttQ3vSo4wimXFQk7SN87zgaDXLEjnYSzYtyMgaghv/Q
	ELsXEQt/VnT3SsTTc2oqJdEut9ZfF8TdpkJG5M4DMtdY+EEQ/KI4RGshvqhSGeAc+rshDsYjNgq
	R+xxow6gKvFl0HFxrTvnykukPjOfkJ1jNvp+QRP2+1qvdZUbSr8cEX+M+LM4ikjEkkWRNZ/745N
	stCRDF03jhe8jdUA954BjtvSUcvZbii9yWyWZp3hjXpgEzH1Ocz37kmDB74bKOCVxPbqQ8wAkMd
	qf82GHe4npUsb51RogdOmfzQ+1o98aschY46bVVgJkSXftQAoS++PuZt1WXaUig36EpfuCScBMn
	+peSPkX16R/kYEVMv
X-Google-Smtp-Source: AGHT+IE2ObE00bmXtNKeLj6UQ2w2+eAieeGAdLJ0M/xXCi/xaTy8JC6h8IF0f4vMWbYgt2AIXHQI2Q==
X-Received: by 2002:a05:6000:220d:b0:3a4:f744:e013 with SMTP id ffacd0b85a97d-3a531cb8521mr9854409f8f.30.1749487276093;
        Mon, 09 Jun 2025 09:41:16 -0700 (PDT)
Received: from giga-mm-5.home ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45209bc6d50sm115775715e9.5.2025.06.09.09.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 09:41:15 -0700 (PDT)
Message-ID: <5a738b35e388f7c339b94e792a79d0d1b93d0345.camel@gmail.com>
Subject: Re: [PATCH v2 4/4] riscv: dts: sophgo: add reset configuration for
 Sophgo CV1800 series SoC
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>, Philipp Zabel
 <p.zabel@pengutronix.de>,  Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,  Chen
 Wang <unicorn_wang@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt	 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti	 <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>, Thomas
 Bonnefille	 <thomas.bonnefille@bootlin.com>, Ze Huang <huangze@whut.edu.cn>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Longbin Li <looong.bin@gmail.com>
Date: Mon, 09 Jun 2025 18:41:16 +0200
In-Reply-To: <20250608232214.771855-5-inochiama@gmail.com>
References: <20250608232214.771855-1-inochiama@gmail.com>
	 <20250608232214.771855-5-inochiama@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Mon, 2025-06-09 at 07:22 +0800, Inochi Amaoto wrote:
> Add known reset configuration for existed device.
>=20
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>

Reviewed-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

> ---
> =C2=A0arch/riscv/boot/dts/sophgo/cv180x.dtsi | 18 ++++++++++++++++++
> =C2=A01 file changed, 18 insertions(+)

--=20
Alexander Sverdlin.
