Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F4D352F89
	for <sophgo@lists.linux.dev>; Tue, 20 Jan 2026 04:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768883934; cv=none; b=rNF/EunCu2sWi9gLo+YQBUlfuXcfQ6OQckEjBrae0U2+bzOPZ383iGEsiWg6IajGiQ82x+SBplDVO9fP1D7Gux/tLDFkc3PKOiayk4H6YlX3VrupQuSSfIjRsb5PIfFPkreY0DBw0mkhOFDD3yDLJLg9QJOYuOdEGPsbWVCTSX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768883934; c=relaxed/simple;
	bh=su3uEXlT84BJihz2o9XFbF/J8Fa9DMBq2JoIbnsewPI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XFU49ztwl/hFWZmvrSfbDYx2BPOVwOAfP4j5tqMxTzJ2AoIv90Cmg790HvFtvcaRhiDhIuL057f2YvTB6GjCxZbc+IhgU8EYNxW6sOuVHqlfZeKs+7Uao78yfMuFUMI6BDHs0SxUUIjy8I9THb246iO8Z0v6LrydF2lYYX7Sl5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NriPNokF; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NriPNokF"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-8c6cbeeb2f2so32409285a.2
        for <sophgo@lists.linux.dev>; Mon, 19 Jan 2026 20:38:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768883929; x=1769488729; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gv5G6VMcszifsvErGVwkIh6g0xPeD3R1+Dyj40SWmEo=;
        b=NriPNokF8SDU1TASVW8J1yztoLV1rk0WvKQ3wtu9BLXgPVE19gKx8FNsFm48glfUJV
         s86uvilfu/xoGFXzgbp/qurDM6BLP+ejdP6pi3RcWFBbktK173QTgfpSMU3YJw1edCCq
         KuEjbFY1fBlREmi5hF5fJzYRwZzqRKYh2Xwf4cyHHrT1gC0Wwt5+Pd9CFKcMfeIPMULi
         ENeXO/amQIhR9ftlpex/UKtL7B7bQjgdFQAMOUCcYuad77mGvUlqwMQx4HL7fE6+Cbvq
         s8pwY7sg6fCGzJ2iWvr34uLcLZnPNBfAwko97RWrjp7XWwfmvqw2D7dgwRx8fziSmMiV
         Xc+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768883929; x=1769488729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Gv5G6VMcszifsvErGVwkIh6g0xPeD3R1+Dyj40SWmEo=;
        b=IoLrARGkBYyDjQN0QyAZVelkU4nuSg7vBvuYt+IdCdf9JKqFTUcORC1izPJI0PpjwS
         Y89GdWo3N0hX7rDrWX0z/a2ysS3UxJOMniHVkCzgK5b/cBRMpf1J63Gz1/Tuj4E3B0m1
         DbrXSvcJDo6o18q28lBU3Zy4Wbzt2pgVQuWEnFVg7qeUlM+Sya6xxrNBH9uM22kSSCup
         PIj6ogRQlmNWmp0N3m3blMn9ao3KrbtFMD6ZTFgPufONADFfP957euxPtGWs2FA3rQbH
         Frp6FX8kooojMrfQDkSJD8kxCM8cduOu/8w+7nK0NbgJWd2h0VDhCG6gCVH5JOHPmvSY
         oSeQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqBvwGibSueVZK5o/95gxhZ0KFSVTnNNWXC8/WdZ5qA39J3ygalZBPElZQEWwS3Ndbc3l0ZOU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwPhjeiBHuZxpl7Kvu3tPZCJ+tsgSFolAL9T70zmffJBsNmtpFT
	wGfC6L/HYsF3zaZ0NZyggx23gPhKeNxdTMPLpRGAN3XRmZVvNvXG8wsR
X-Gm-Gg: AY/fxX7GSk4yPt52jnMw/YTL03T7KdnGA/SvIy6qGRHOUsv41v1agCJRP4NIbVCMhhb
	nth05q5PDUewoVRVLH+3YGJST7MGZc6JBuIqlWr7lIiYazcV1mGtOxJ6PI6BmmcIih0VL8t6i4t
	Is/DdfrQnQup8ES38hyRQH/eAjXsgfcutTKvgAei3qWEZPCmkhTttAkZShbuMjFoERi+qP/aALN
	+wJrm4TPy1kPpa3XpHhyR0KjFEN51+QeVss6MPAPrqzJ4hilgdJ38KHGoKnbGqSqsxKoHIRSy9H
	yJ8ZtkYJlpqwbHkbQh9mRcSdi0CT0XrKwDvy5uvxVM2wWI5SrUH5I57OPof2CpnMAhO+KDm2Nvp
	cUxj6Vwyv4pkgU1CHL92Yig9YZa/fr/ktp5Y7G/bmNFFBxmITmHSgszovjZLBA3DM1TcUziV+et
	cS2Oy4S4TiYw==
X-Received: by 2002:a05:7300:8189:b0:2ac:2e71:90d with SMTP id 5a478bee46e88-2b6fd5d8192mr302967eec.6.1768877334281;
        Mon, 19 Jan 2026 18:48:54 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b34c0e22sm14967921eec.6.2026.01.19.18.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 18:48:53 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Han Gao <rabenda.cn@gmail.com>,
	Nutty Liu <liujingqi@lanxincomputing.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Zixian Zeng <sycamoremoon376@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 1/2] riscv: dts: sophgo: Move PLIC and CLINT node into CPU dtsi
Date: Tue, 20 Jan 2026 10:48:41 +0800
Message-ID: <176887176535.427065.12899087990982068409.b4-ty@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260113023828.790136-1-inochiama@gmail.com>
References: <20260113023828.790136-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20260120024841.nVM44EobFOM2m91gMNA5NgWiMek8Gz4GPrX9TuQ3h-8@z>

On Tue, 13 Jan 2026 10:38:26 +0800, Inochi Amaoto wrote:
> As we have a separate CPU dtsi file, move the PLIC and CLINT
> node to the CPU dtsi file. This will make the sg2042.dtsi force
> peripheral devices, and make the CPU dtsi force CPU related
> devices.
> 
> 

Applied to dt/riscv, thanks!

[1/2] riscv: dts: sophgo: Move PLIC and CLINT node into CPU dtsi
      https://github.com/sophgo/linux/commit/5e6836e735f9c9c5e8e1d1dce02dfed5fe566e8f
[2/2] riscv: dts: sophgo: fix the node order of SG2042 peripheral
      https://github.com/sophgo/linux/commit/ebb87dd74c34a76e1e93041e9329cf9269be35ed

Thanks,
Inochi

