Received: from mail-vs2-f38.google.com (mail-vs2-f38.google.com [74.125.227.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E113140B372
	for <sophgo@lists.linux.dev>; Thu,  1 Oct 2026 16:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790870933; cv=none; b=MDrfktKvqXrcIbpUeA3kBEmCt3Oci2EDtx8b+IqFm+Q1POBlZFzlK9XjuaLaivgwjin6ReEsyE+1g7JS7MXNcd+K4UgmtyGgrhm9UIAnnxl01lFrDKCzvI2H2YvSThSSD1lkLAuy+cLXjr3MeF/pzWyZKhbhM7jfH0sMz2kagow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790870933; c=relaxed/simple;
	bh=km+eyEF9ejWZCj63DVMQwjL7mTG62fzWukGv9EvlEqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JoQEHsuWNR2GEExnJiP8rV1g4sFmdz/pS3MJeW1dEmwhw1rHlThBfG6UhkR7LnM5B3IyTZaQ1eMwJ+IEabFUvzE8O277YTUa18tuJzzI/tatVdiPasMVZeVuv1h1VkJ3vC9i7xxJW18mOe/fsQpQ29TGfFingNh9srdJB0qqLJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=oHEpQDiv; arc=none smtp.client-ip=74.125.227.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="oHEpQDiv"
Received: by mail-vs2-f38.google.com with SMTP id 71dfb90a1353d-5cdb9cb7feeso2445908e0c.2
        for <sophgo@lists.linux.dev>; Thu, 01 Oct 2026 09:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790870931; x=1791475731; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Otf9/knLO98bfm0267xs+E0698DkiFYH19su1j8Mlag=;
        b=oHEpQDivH+wixy8rzQ2410oKJaIiQOuHq9FbearmVZe6IGcJb7EiNkrgLME/9pVgmi
         LZLmJsEP1lvf3OaDQ6FBYU0MNG5xnaJy3wM9HEvRwjZJSRNSrsrC+HLr25zdT6JhaJ7I
         Uu2S3jLsT7NvB1KGiGzaKIA4B/Cf4DwwACg+a9pTFfvtwPCuVM63VdJRs5MA+plzdvTz
         aR37lNxRLxlTpLpurfEcqIcSJ59X/78Y1OoHNOgOg0ZOL/9H/msdqNveKacOk6PgOTT/
         qxwJ0YFB48/TXnqfmK/WoQmh+uMzxFuARWW7Ie6R0zRWzFWe+aTrhLM8WBPvqqKoo8Ss
         HVqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790870931; x=1791475731;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Otf9/knLO98bfm0267xs+E0698DkiFYH19su1j8Mlag=;
        b=Hd8gV43cuNRjanUMAoF6YrdDn9GoULmThInpiiSjq/HKCrw1iOSS8YdrbsslBJ00R2
         s+1xItDd2pX3grnVbftZaGimH1tGMcpaEqSg5+scXTw6SMm+icVxmY4+CM3hR/KSHgGO
         /de4wYgv4zhXAaZGNklh5660QQDDyBQ7MAOrQEySavrXDDeONXuDHWvbdDMoI5MM58AT
         YwRBtNmkXzbWD8DKoyCkD+cKESaudPwr+GbhxI98OCbibfjlQ064fGgSTzFqA4g5dZ17
         4hsZy3KU9K4+wHpZG57vd62XmsN7sGKvVBeTgn3rvowUThmP4jVa871X9N2eYWxWcnYu
         5vtQ==
X-Forwarded-Encrypted: i=1; AKwUvBw5ZWwa6l/n+ZIE09Ic6a+Ym4XHST1MAlHB/X0GEBEuFjtxgSjfQ3juUMNxpzNsERKKq2W6OBA=@lists.linux.dev
X-Gm-Message-State: AFq9FYIS339lN0HIyNYyo8O4Myjd9YGDlNWp+qhlVsQggeBLyunN9Gg1
	j1bXWKxeegRdh25ywEN5j34KUWeTiKvm/Z4Dv9rJ/ATd86YEWxUIPOSGr8alN5+pvUY=
X-Gm-Gg: AYBFou0UFXYiC03OwvcLmdkxKcKqIYNduC6BDD4q0RBRWNFYGIotE2734IZXQpgECKF
	zN8WAtsUZNAHXCRzz4FUQZtVCFiNN+/Vu4ENOvwvGNDOQqFt+pXuwfNBInlgYdBbO3rGtnXKKZx
	1bDtFmhcANCEvV0+XxkU5dppLc/DbIKyYc4Jk3j1lziFSotNfL8f9tEMTaGrO98e027aaHkVBLL
	hliWKHGqQNRP6Y799Bwl7wllVgRCEDKDTuSWMEtq3F/CFYe/CzGImmSzsWprtDRDfs3OafWEtVC
	2lt6yUsTmPMjkGHD7P3f/SZT7w5dZkXB5SnTsOMX8BhgVFfqbak7b5A5la1olfieRpDWyOd/gFu
	j/9cjSbRMcuJqFdsa73D3SQIPIc9a5NHGN2Pe8bE/dY26nnUpfmxshaYaN8uD7sDa7hAT8Dfa24
	9RFHiTYol4S8gpk4yxb7IZFKKVHMWUM1yxsFQVd/P5uub7vVLrqvXrVEXHvkjuiBsbP2frQAy1Q
	Q2q6F8fb3LBMUC6LI2a/vLm004hay1x
X-Received: by 2002:a05:6122:551:b0:5d4:1193:73d3 with SMTP id 71dfb90a1353d-5d67c10673fmr1731771e0c.14.1790870930920;
        Thu, 01 Oct 2026 09:08:50 -0700 (PDT)
Received: from hiagonb ([2804:14c:4c5:8bf0::ffae])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5da61f8fedesm170893e0c.9.2026.10.01.09.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 09:08:50 -0700 (PDT)
Date: Thu, 1 Oct 2026 13:08:44 -0300
From: Hiago De Franco <hfranco@baylibre.com>
To: Andrei Lalaev <andrey.lalaev@gmail.com>
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <chen.wang@linux.dev>, Inochi Amaoto <inochiama@gmail.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Subject: Re: [PATCH] riscv: dts: sophgo: cv1800b-milkv-duo: enable ethernet
Message-ID: <ar6E4bQAKonCW3st@hiagonb>
References: <20260930-milkv-duo-ethernet-v1-1-428ff137f5d3@baylibre.com>
 <20261001151447.12076-1-andrey.lalaev@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001151447.12076-1-andrey.lalaev@gmail.com>

Hi Andrei,

On Thu, Oct 01, 2026 at 05:14:47PM +0200, Andrei Lalaev wrote:
> Hi Hiago,
> 
> Please take a look at the patch [1] and the discussion.

Thanks for letting me know, I missed this patch. Do you happen to know
if any overlay was sent? I was not able to find one.

If none was sent, I am happy to send one. Sorry for all the noise here.

> 
> Thank you!
> 
> 1 - https://lore.kernel.org/sophgo/20260803163323.74414-1-chenyou910331@gmail.com/
> 
> Best regards,
> Andrei Lalaev

Best regards,
-- 
Hiago
