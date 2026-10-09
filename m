Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC00C3C197C
	for <sophgo@lists.linux.dev>; Fri,  9 Oct 2026 09:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791539267; cv=none; b=edqxjRhyBehJWTmchVBtAbJQG5CMOgLmmGiC+om67YZ1NQNOHvy6wUS3zPYd6vDuH3bGBKQeUEfnYCJSQB1s79wS7d/ZttMPFuOcZGKEToRD81iHpiS8eHlm/w3ac3yFkhap4tZsME39USRGfX5UemqS4i8JTKRxKO+HHyA9RGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791539267; c=relaxed/simple;
	bh=B4rpVl4mptJjkcyRtvFrb+ksh0rsTg1kk1VMkeNJfyM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eIUIrhfRQ/PcObMNi/T6jrx3UfAz5uXCZ6jLw10FG39YYT+FGia/tb8qk+Yfk3hRVMJKRtleQz+bVKGbvhIvZwWS2Zy+KSzC7+xgaBLfBWubqoNvnijEvdvgN873wNJzp449B4N7JAgbjQFZVUYscjkOhH0eC0AIQPx91EyyOh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XM0RafDg; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XM0RafDg"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3a80d1c98f5so3757983a91.0
        for <sophgo@lists.linux.dev>; Fri, 09 Oct 2026 02:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791539265; x=1792144065; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TrPTdcZ/njH2i3/j2LZUGAT14iJIsacuNVj54+laGas=;
        b=XM0RafDg9DO6LVaFmlAKnAbMturL5gl8haQxdbV2uho041JfVtneWGUt/R5mD1ftf/
         vj990puvynE+mvrpitkA6nmiQZSwZ+V8bWMucH7HukPFuPlXU0ZxWKABqk8eNOVTzavr
         tndbDP+71mDW2sK0pm1nRNIpl5ZQXf3j++1EDTteb9sBxgTkRC0WrI/ljhnPuTbgJaKh
         lfgQpwGVUmlES2WKXTIT7UepY8mV6UW/4/wn8dOl3e1lgg1y57ms4ZMmILXtE2xQIxQe
         a9Q9JPetd/JM4Y+rlZNpmtH4uAoJD8gtwFZ11Ro2xwS87X6PFX84DMOyEyENDriqk+UF
         jCuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791539265; x=1792144065;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TrPTdcZ/njH2i3/j2LZUGAT14iJIsacuNVj54+laGas=;
        b=gBK/C35Gl28tW+BG0Mn46UQz2A6ja2Uv9HQDRvODM0/GliiZtvUmbWb1IdzogXJ/NC
         kXAqmbEVbZZqNZ/eYlPM0S7aknx++fI8zwSQsm6ufJwB5wHc5kn4zBncArWoYpUu7p32
         yd2i3q3/mRkGKhoWGymm19OeZyLV++p3rA93dc81lQg1OI3zTas6X5Z51tNXi0RxuTb4
         pno49y0gmhUlhZEU5lbzTDLdGJJZNyRCrw2pLa9rOu3WeCTms+U5rEpgyLYQQXbwKG4x
         7vMK7LXl832bFre8fiC0yQqNLIAnya0105DGbmfVW+3DvedtSFqJIvywrVEOGlHT3LfC
         6w0A==
X-Forwarded-Encrypted: i=1; AKwUvBwWtxAjmXR0cf3YiWY1kM8zSImfDWCFnY152RTzVa/o4ZnFa4/mfbenWSuDkZYd6VLEB1SqqRE=@lists.linux.dev
X-Gm-Message-State: AFq9FYLVwIjlxiGtOh+F+Ir5V2WqIIsG9wqdJII9fXwt+CInK+LwcQO2
	cPDEZHcNaH6IMZ+oP8NrhNVnNtSeVfDYh+SBEVUKPGN6e8879XKStvyK
X-Gm-Gg: AYBFou1mpVps0IQzCED4voipE4UuNdUSPEN6FYoQ9AYxsnOlQxiaQISSoSL9dHyA7kN
	nITfNcEC1W3A4VF1Es0O55tX961cwNv7Zu15uyjNILI4GidUXWTXMJB3vEVIr/3ulno6QzYRCCw
	td5JDsI43I/7gGauqOpZbhEZ3L51I0sJy8XW0A76mGY0QJyWp1V2+IxtB+02eJ9nhtepODFdjjM
	/We2MMl3oyE86Juss1iDObIALYLGORgm6tJLJaaaFC2jsLnBMgVpby3f6QB+tmkZpz7ffjtYpmZ
	k5ExZwK4VpZJIvDbrwn0Lu++SAjUKBcM9OgHcLGgwa0tWIoJZU4Dfh9vZ2EYiaTTAmPBq8QcLxB
	cHdY9xcBI7hQrzzULrdl60TZ8bPFjJbm5YmGFNSYT56X2ZzcE0aMqijaZFApv0p9T2+x9TcEnl9
	/EiBA/rTIFTayNfNWEzT+7h8Nhd8hQutSCwSLxLArGX4o7ueokEfG4ZV8EsOXhu/CnMPKX
X-Received: by 2002:a17:90b:224c:b0:3aa:faf6:a951 with SMTP id 98e67ed59e1d1-3ab3a9a93b8mr1318325a91.37.1791539265069;
        Fri, 09 Oct 2026 02:47:45 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38b981b9sm2638018a91.5.2026.10.09.02.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 02:47:44 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Longbin Li <looong.bin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <chen.wang@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Han Gao <gaohan@iscas.ac.cn>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	Han Gao <rabenda.cn@gmail.com>,
	Hangfan Li <lihangfan@iscas.ac.cn>,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: Re: (subset) [PATCH v2 0/4] spi: sophgo: Fix SPI NOR errors and clock limits
Date: Fri,  9 Oct 2026 17:47:08 +0800
Message-ID: <179153921379.259252.17749060045138037060.b4-ty@b4>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261001-fix-sg204xspi-v2-0-014dbaf22b5e@iscas.ac.cn>
References: <20261001-fix-sg204xspi-v2-0-014dbaf22b5e@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 01 Oct 2026 02:22:49 +0800, Han Gao wrote:
> The SG204x SPI NOR driver ignores transfer errors and clock limits.
> Fix both, enable SPI NOR on SRD3-10, and use 12.5 MHz on SRD3-10 and
> SG2042 to match EDK2 and the vendor kernel, respectively.
> 
> Tested on SRD3-12 at 12.5 MHz: both flashes identify correctly, SFDP
> reads succeed, and two full 64 MiB reads per flash match.
> 
> [...]

Applied to for-next, thanks!

[3/4] riscv: dts: sophgo: Enable SPI NOR on SRD3-10
      https://github.com/sophgo/linux/commit/0fe449e8ff7b383a8375e85ebca40133a02f3348
[4/4] riscv: dts: sophgo: Limit SG2042 SPI NOR to 12.5 MHz
      https://github.com/sophgo/linux/commit/a3a8c25c59f8024eb70a460767ff0d7bcb213338

Thanks,
Inochi

