Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096D821C18A
	for <sophgo@lists.linux.dev>; Mon,  9 Jun 2025 16:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749487186; cv=none; b=Be+vkACWgH+/vC43IFKo1v4pTBr8UKBoCUGUfZY9XuujdifxUFZzcDwzABZ2oAKzG58RaPMDdOOEF+VYkGckxTKWw2fpkWc8vn7EcxlpvoerdlYInIUmoqRG5VcAfxm0k4MH0vgRZHVB40wRtZiurZ5kUqeB09KveLnU1HTw5sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749487186; c=relaxed/simple;
	bh=b5IAyMi8bog282MCnpmIozPAGbv4atmEqp0JP+JLJVQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oRHdndwfc0YSqIO8zpAtO47cIX+oxlmHgRaW0N4vs5Ypzlhx678hTWvBbxoSfsbUfodrhgGPpuI/cruuS+Sqa+P0+1GhaBHNy31xSBjHdrMFtMRkMSLA994uifq6C74eFGOhRhSXIU3WrjUCKd9EYhFP5vpgnYjn0M9Q1v0BXak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CrXIRfMH; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CrXIRfMH"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a361b8a664so3783094f8f.3
        for <sophgo@lists.linux.dev>; Mon, 09 Jun 2025 09:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749487183; x=1750091983; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=b5IAyMi8bog282MCnpmIozPAGbv4atmEqp0JP+JLJVQ=;
        b=CrXIRfMHtDBUs8G8FDwCv2w9RRpu+lHGOe4Fo96x20nOo2wPKZP9qAsJ3rircdelNQ
         qQavFtou37aGx9+GQqxjNRw2BuwDYH/jwhLqjRRAk5nauHrHVuB0La3g02BGngIqc831
         ZO5HIMsi1Jb2CAh2Ush9Wu0t+np26vG6ZvpRO1q70+KvtLH4+ZA/U8tTurceu3BbP+I4
         M/3rqjI7yjC5dO4RBwea8l6KQ7gwQMn6bWgfM7R8sThx3WV6sA6nAwdUP83EpXrEGjgQ
         mX1ACRfHIR21AlO3NFKgmnSYkzyv1GMx/wQ91OkizSoDZ/q4pYCi1sBqn3fAw3AksGNH
         opGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749487183; x=1750091983;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b5IAyMi8bog282MCnpmIozPAGbv4atmEqp0JP+JLJVQ=;
        b=prBEVLjUG0Jf4eTgRTMGIdu3clGBvOJKdYDspZgAzM6HUt1W14Q1BUJie+WXRBhqnX
         W0gWH2XDEjYWApaKeJ6gKSPNz+NbDm2jMpl6M8LsOV1aB8Hq/1iJOW8uJI/hGNS2SUHP
         9SR0V6Iq1GFyTafcX4LEGWe8uez28PXbCNsudHq7P7651nD97Zrvu10Z/zARfEYl1aNZ
         Oao2COgGPbL38V5CmJkMP0rXxDCVvJP2JwXQaX7IBOzu4CaGDN0jEgVGEoSQmIsar+2N
         UO3YSvXou/VA4P1Y7O7Frrn5mqDwPoMJEiuKmKg1NJUDNPZiM8FGbk2srO6y3buEhapa
         GIpg==
X-Forwarded-Encrypted: i=1; AJvYcCUfPo2Fds89PFuqMwPiTwBlu04AKm7Mun6xXVm0URbujGZZKaEJQVIkcEzMr6abl3Fd3MkEVWo=@lists.linux.dev
X-Gm-Message-State: AOJu0YxeFmKt5UG43j6PcGd2OFdC0MOICWu+WVXELWB3eSUXkUa1Med9
	drpOvS4OjUJ/vQZIZbU+vJCidXX6Cp9V1FCyhRMzK6tuWFT6/UWk4R6g
X-Gm-Gg: ASbGnctoDVAI/zpZKZlZXJjF4/ohnMW8BlFGXnHDYX18y++4x9XRVS6tLy/FCJyZCka
	Y1Uqcg5oqRmuKEJylrmkmWt//dp9N3v3+NjMgwO8cHC/5+P7QL+1XqSwlKopvH358nrNHtrSjix
	wZlve0OAogw6o137RtK6BHshtKBR64hs/uaQPheddF+xiXEAsbn1ugE6ips+QhuUv21DUGTLcEc
	I2rWRRGtajRvo88S+sz/foFXTcttigzb5AwiKGTqjRNjwU8+RY73jmVlMSA2aQyLhN6pBp/a2NV
	54x8Bc8pnUA2izLJTSy/FGW/PmsINmRfDJKy4fSo+vwtZsmXZUyVZB/Vo7q43b7i0n2atzkn+KY
	M9QaJJw==
X-Google-Smtp-Source: AGHT+IE9fQxxC4zIGJ9d6F5tS1v5nb9uy1nE232lYSx4KIqFwSxQrRWo/+NPZxfe3hvsc8rcGcPv0g==
X-Received: by 2002:a05:6000:1446:b0:3a4:ebc2:d6ec with SMTP id ffacd0b85a97d-3a53189ea15mr11001381f8f.14.1749487183160;
        Mon, 09 Jun 2025 09:39:43 -0700 (PDT)
Received: from giga-mm-5.home ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45209ce1afasm116930245e9.10.2025.06.09.09.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 09:39:42 -0700 (PDT)
Message-ID: <902db298b21cf78a2c27ed0cdc002e7f2861c428.camel@gmail.com>
Subject: Re: [PATCH v2 3/4] riscv: dts: sophgo: add reset generator for
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
Date: Mon, 09 Jun 2025 18:39:43 +0200
In-Reply-To: <20250608232214.771855-4-inochiama@gmail.com>
References: <20250608232214.771855-1-inochiama@gmail.com>
	 <20250608232214.771855-4-inochiama@gmail.com>
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
> Add reset generator node for all CV18XX series SoC.
>=20
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>

Reviewed-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

> ---
> =C2=A0arch/riscv/boot/dts/sophgo/cv180x.dtsi=C2=A0=C2=A0=C2=A0 |=C2=A0 7 =
++
> =C2=A0arch/riscv/boot/dts/sophgo/cv18xx-reset.h | 98 ++++++++++++++++++++=
+++
> =C2=A02 files changed, 105 insertions(+)
> =C2=A0create mode 100644 arch/riscv/boot/dts/sophgo/cv18xx-reset.h

--=20
Alexander Sverdlin.
