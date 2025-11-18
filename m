Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1C43A1CF4;
	Tue, 18 Nov 2025 17:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763486302; cv=none; b=D60BufnWpjGSSVNOVtTLf0K4VKBibQ8XehlvuiEy2+Ul7nnUIWNVwEQRi4XJP5ck2g/S2nxchLLQFeP2quPFjr7LHjKd0AvYW5rdhusIG5oTTzAj06Mv9AAEx5Es/uktyVxrUb0ucSbKHa9kr7zHTOuByBD3huXAVjHJZNENhbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763486302; c=relaxed/simple;
	bh=pSCQcByahWJnRfLSXLmxMBD7rknLLPO4nqRz9Tsoy6s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=evaVNPAHcgNP23H01m/XFEezckmALNHJqksOYzf+E38EN1x7AqomH5DmaXYRnil+hGKmDqmscPqbp+SK0WoLZX37Ax7wyyMzWcWdNpeVIBFzdTzKXffLTkK71UtygkTnSVMRHfHsQAiLlZA1ymLqDdwIa8y9tMeAgU+ZQ/WYnfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FcU3nQYB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FcU3nQYB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDBE4C4CEFB;
	Tue, 18 Nov 2025 17:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763486300;
	bh=pSCQcByahWJnRfLSXLmxMBD7rknLLPO4nqRz9Tsoy6s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=FcU3nQYB2qlfIz4uXVOLKguWLApHIVYACw7R4O+42DUsqnF4IMSeeOTdZFGXLUVT2
	 BFSFmnozoPkzVvHb6c2wNOKrbI5hWuzSnofDFh0x3Ow11/rUnW4KJbU6y+pq8SGjWQ
	 Tm4GyqUas52RTx3GZziPzkVb1pcTg4GYv1vM+Q/6lPCVmtZvGmvqn1f6ph9CnOrEC6
	 YTgJ9qD1DINcGZbW9Bi27pndVGwJKFyTWAx2AKXsZXOKbz46hOPz/vUSZj4RJoLAvt
	 lxJY9jOaL3nOEeCsldziMDJ1kkmJLjKNpr5aKJChflXNpxTfbhxm9u6oBG4bpGUN5z
	 pgWAXpLUrAZVA==
From: Vinod Koul <vkoul@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>, linux-phy@lists.infradead.org, 
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20251112085220.1452530-1-andriy.shevchenko@linux.intel.com>
References: <20251112085220.1452530-1-andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/1] phy: sophgo: Remove unused of_gpio.h
Message-Id: <176348629841.62598.9297270264044310664.b4-ty@kernel.org>
Date: Tue, 18 Nov 2025 22:48:18 +0530
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Wed, 12 Nov 2025 09:52:20 +0100, Andy Shevchenko wrote:
> of_gpio.h is deprecated and subject to remove.
> The driver doesn't use it, simply remove the unused header.
> 
> 

Applied, thanks!

[1/1] phy: sophgo: Remove unused of_gpio.h
      commit: 42690b8ec861b502538e425c5a7feb7a38764f04

Best regards,
-- 
~Vinod


