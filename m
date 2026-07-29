Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6823931E826
	for <sophgo@lists.linux.dev>; Wed, 29 Jul 2026 01:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785290145; cv=none; b=Y0c5BpOZiQVYmdg3WmQioK+sauny+20/I0hcafaKJlsQksHP7xkvhm79qd2M2me/Gt1ExLX5+pebMIIBXhVx00oLKHrTLed5xwTbYUH7kawX27tawIGlZBbdKcPZ8eweS0UQ9L/b4gktbj+gCEN9vMuRtvMTO+4JpD1iToLISYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785290145; c=relaxed/simple;
	bh=7d+GQbaesuf6z/xU0uuiZcz8BKi39yg5+zy534KfOZY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GThbV9X9YaP0ygIC1wdSzVfdUOD6jYo6UHw4PoK6nsXuRBVG+ihstcWiZyu3R3MoOU+9D5PZ8Jz98yfLigYtdBbuOfTF5GyMVQXckenlMLS7DoLDbhlQ8ZM2+/bNBJLLi01YMRezOMh6H/sosp7iH/RcQg3BOz/wPlLU2XNA05U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ohtRtwZg; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ohtRtwZg"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38de840f2f0so368317a91.0
        for <sophgo@lists.linux.dev>; Tue, 28 Jul 2026 18:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785290144; x=1785894944; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WgpbITyz5r54kEwZv0NwNpMih07miMaqmNgkn1d9m1M=;
        b=ohtRtwZgtdycMyo0p7jkvg/XF0mfFGtfFhhrGuYevnkzf2QAqSIVWm5o/fmp4wPvu8
         p0xhxrPFRINfhfoNy7K19N6GDEcGFW6NDy5/jO3MpevChux2C+StUs/H1gTSc6CV0bgS
         ThybcOj3DQD43eQRVPmwNcUo5x3lnqEuBT7WVK/oP/R+hGn87znavD22bFNN+Un03YMO
         1UltS6GMgr9fLU2TaAlOptkRHOMLSmCpBp+WMOATIzkwfKa/v6clEe3uwdP2JM/kuff0
         DJiwUQZppzYeWowEtotB+AHmpq2arosXhvlT/fTDVNNJZ9vkbXXsc+6Pz1eCKosU9tEK
         HjTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785290144; x=1785894944;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WgpbITyz5r54kEwZv0NwNpMih07miMaqmNgkn1d9m1M=;
        b=N/GfvdCghM1pWcraAgh/j5TGjFnMaYgBEvCs2OphK+iG1HGDyuSsPW6t9JxMcnYuOk
         zv4Q7dkMaJfGKdLp3L4doIasZcZlubup2npiU9YnyHid+HIxILFTZC9vbyC8VZ7B09Uk
         +y3Qs1t/sir5Wvs+XxBp9sWE/jY3gtqCQJGMUNihw+jSfxhOt5/1gpOMAc0e4VYH2XH1
         vEyGRwP5KWHuF8aHZjMgTcHjyEXm2wUskemQIItRkw0S4xlWw5vEb/i3kIp9jiU/8tJt
         WnzHtTvsYqWJa/PNuPfmWFmtF2UC18SieAC7lz+AN8h+4oNbEkMbhSDht2RRzyY82smT
         0JZg==
X-Forwarded-Encrypted: i=1; AHgh+RoV6Kpsrv39JBksurYSxoeex9GXX6InG4yO0U+RuoaTV5b0sgF9SQJNbYegSCKthCl+mDwjR8A=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywuf6ypHA+BYMQbbrqhrYgtyO7cAUFTcfOumEfcC/t3rFZFFxyF
	/+gvcJA3TmnKgKue/xxRqsofEnqF1EoeDTy1MoZH41eGxU+DkJ9WSD0A
X-Gm-Gg: AR+sD10WnFCI9t8xB3j5ldrfjojzPFoXyyLqU4sJB3Pm3vV2lTfinHnMfB7TNqnmQAL
	w4Cs8YoFjyTjxQPBuMdiA3ohfpKKwuUacHyxjBFwSIAl0xG3dGwz9T1zDuqDBceLegMdcAj2EKe
	Qsdb16bffF1h5LE8EhQWdyiqu0HedITkkgS4Cn+t3N7UwjwS0LAUwIXA+XcjM9eUZ4oZqjkVG7q
	hNeRVP/EUF7LRQ2xf87t0cTDQWmhopr3tk5ItvIRk3dU7rm4/YcKK+vWxvLSqOgTTBiPy35XiE3
	SwPIdvuN/a56HTwRFuyU4eRjlChLtC3NJHtgMzw3mNZfrccy0xW7swCGa9UbGAI4dA+netjq4Sk
	Ljn5EaEVM5bTgwSv7inN4cZAG3mAWzVpjrAjqCH7NX6pkP7M8lVRqVXPZG9iePgCf7/MEcQ0EJV
	SE4YIiTfxV8GxuK+n44X3eaAg/XvZFaoQaAs/UVWksEWLz6OGCE/WtyqoKjxQ=
X-Received: by 2002:a17:90b:1644:b0:38d:adae:4866 with SMTP id 98e67ed59e1d1-38f6a3dc276mr5144331a91.21.1785290143640;
        Tue, 28 Jul 2026 18:55:43 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f642fbf74sm2022334a91.17.2026.07.28.18.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 18:55:43 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Longbin Li <looong.bin@gmail.com>,
	Yixun Lan <dlan@kernel.org>,
	"Anton D. Stavinskii" <stavinsky@gmail.com>,
	Alexander Sverdlin <alex@sverdlin.org>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: Re: (subset) [PATCH v6 0/2] riscv: sophgo: allow DMA multiplexer set channel number for DMA controller
Date: Wed, 29 Jul 2026 09:54:58 +0800
Message-ID: <178529008848.164571.1132515193531771269.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260511063818.463877-1-inochiama@gmail.com>
References: <20260511063818.463877-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 11 May 2026 14:38:15 +0800, Inochi Amaoto wrote:
> As the DMA controller on Sophgo CV1800 series SoC only has 8 channels,
> the SoC provides a dma multiplexer to reuse the DMA channel. However,
> the dma multiplexer also controlls the DMA interrupt multiplexer, which
> means that the dma multiplexer needs to know the channel number.
> 
> Change the DMA phandle args parsing logic so it can use handshake
> number as channel number if necessary.
> 
> [...]

Applied to dt/riscv, thanks!

[2/2] riscv: dts: sophgo: cv180x: Allow the DMA multiplexer to set channel number for DMA controller
      https://github.com/sophgo/linux/commit/3c698b64db0145fb5edc3f19e4170b41b4508281

Thanks,
Inochi

