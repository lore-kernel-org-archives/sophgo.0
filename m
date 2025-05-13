Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF8118C91F
	for <sophgo@lists.linux.dev>; Tue, 13 May 2025 14:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747146804; cv=none; b=sMlZRAaK3I7/dWiI/T8dVWwwigyotLihXpVM4qpu+XkL71fH0oJhhr1MrOf3hJ90UbyFCw2qIu8AoUL9Db0PXWDTcDfTHP2wUEIw62Isl0w4I+Upc5KLnJ2Tg5kLOAVd41r9Bod9oDD7/S6PfthbX5/Trcv/XsamQuyN9FKf2hQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747146804; c=relaxed/simple;
	bh=iQEF7nznmEycoRdRwifBr5zcStMelsRnNg7k+aa6KwY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VWU99sdvWZ0AUD0+maC9g3SqxBXrVg8qNPvu7fkEywUAuv+mQ82GJaIv5NLdmF+PZ/TvhMf3VlxlJS0tP6q3+kw/W2VlkKhrnkMspH09DgD55jHnFy8HfECz3NbFldhhwnwq8lGvQkXIuK1qvWm74V6Ze7sHhU0RdVDnRE5vH0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gY6VamsA; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gY6VamsA"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43d0618746bso43610545e9.2
        for <sophgo@lists.linux.dev>; Tue, 13 May 2025 07:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747146801; x=1747751601; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6C+eOPgBkYyfSbaSp3zhH361dNsffIyxJdkkZYVPmTA=;
        b=gY6VamsAq4fQSlzsdvlQGhZtF+FMXCxP1jR7AFAiXcHWzZ+ZJz/v6VG9M9DZTfwvm6
         nSduUTn5NuSF9iGexck7eR0Y7q0vzpOqyjzM/OaW5fd3/PWlPCHooiCKM4JOYj68BUq7
         K4gz9dtsGUDZ9LM/zn1txVIh7haDIjf8SPVJeUGjvVCCE+lSBsLrcXlGsG8O7Ee9uMvX
         RTymAVCVQajFo9ggPi9YXHQP3+nkn1Ii4+s64T/4Tak4s8eLihybW2kPds61MsicLgWR
         uaa2QxK7Da3/Q4KMcUbCr5iGGUk1/XRQHHDs2KoXEJg0YeqColvITsNDbKfd9u65X01J
         4gog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747146801; x=1747751601;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6C+eOPgBkYyfSbaSp3zhH361dNsffIyxJdkkZYVPmTA=;
        b=ontVFit/nM5SCu37bPQ1aGSA6spRGftLXzb5NZZXlj0lHDnoJCdzWCzV//dzlmBaVy
         YczYiZAZU+A40tn7B7fsxOl2V3SX5XA2qtsUxIKNFLEWeAGHg+W3k404pymMIzAgEQ1n
         wOfz9Ks0gIrM3w6jso7LvtCE6RC1CosSF56idF55UqgyMh/vGZlkm1bmafwuGXhnqKFt
         CUU79vob8Snf4zxjJuaJ+zHt0BwXkTIY0S+PB5cf/1hKsKB7VmI+dLGCjiOVCrSrL/NN
         c6IgT4Tuv/aIoxPskcFCkurw+uGObMvf88IkOkvjS9nEpWaRn/IHj4uJ2jG50nMm4RgL
         Micg==
X-Forwarded-Encrypted: i=1; AJvYcCUZdQ4d9sZjvyzL5oAZbeoRtBOKH5ZskxF/vp3N/W4htr2PIeixXto4ItCBfoupIQ5pGCBMgaY=@lists.linux.dev
X-Gm-Message-State: AOJu0YxuLGhpFVeWlasixIhdqqNNyiMZHHWivf3tsMBBkKWOd2uaDCb9
	4yXdJ3Qlilo+0tScDSOa9xp+P1XiAk8cFk86IUUh9zo4QASgPFaHXwpBXZxAISEaahkHQOUDELJ
	4BiPc0Q==
X-Gm-Gg: ASbGnctXZNT/7dqA1Lf6XCRhb9UBBa38phCsWXqERT6ZdVtrF7KIUS54oskNNlJP2TH
	R65QVMLWB+os4D7zUa3cBpAMNYlgsGnCYWP12PIizxn+xnQwCg5m3hAbAao7Yhm8UfrEulvuxB/
	9y08naHnCfvoqP1ZSNXQhC4rLyOLfnDRaDCqX2oVobGqa2QD5j7xpcES5Bbntw5pNW6+9+7g4xQ
	YhcWIyHM5qjB4lR2zKSS31NDmbwciHQlGlt1/oUJbjNNlyvMntf7IJH7nAvh//4U0osud2JahOn
	zUs+SHHIFe39zUCzKzz1npOchxmDKubmi26hZUSDQTeHV2szPB2O+TNlqHP9whFWsOImZueJUIU
	u//A5CuDqyU8lgQH/GtkOKkGn
X-Google-Smtp-Source: AGHT+IEBNTH4zw64AEMKKTiN2s5UEu33251ThUx0I1Ms2D2DvDbTNPIeVXC3gTvYmyig2JEqJ5+Vcw==
X-Received: by 2002:a5d:650b:0:b0:3a1:f655:c5b2 with SMTP id ffacd0b85a97d-3a1f655c5femr12440694f8f.39.1747146789207;
        Tue, 13 May 2025 07:33:09 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58ecadfsm16357348f8f.22.2025.05.13.07.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 07:33:08 -0700 (PDT)
Date: Tue, 13 May 2025 16:33:06 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Jisheng Zhang <jszhang@kernel.org>, Chao Wei <chao.wei@sophgo.com>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-mmc@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v2 02/10] dt-bindings: timer: Add Sophgo SG2044 ACLINT
 timer
Message-ID: <aCNYItP6SWImMvFv@mai.linaro.org>
References: <20250413223507.46480-1-inochiama@gmail.com>
 <20250413223507.46480-3-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250413223507.46480-3-inochiama@gmail.com>

On Mon, Apr 14, 2025 at 06:34:56AM +0800, Inochi Amaoto wrote:
> Like SG2042, SG2044 implements an enhanced ACLINT, so add necessary
> compatible string for SG2044 SoC.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Applied patch 2, thanks!

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
